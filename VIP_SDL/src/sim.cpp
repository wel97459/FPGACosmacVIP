#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <memory>
#include <vector>
#include <pthread.h>
#include <thread>
#include "sim.h"
#include "crt_core.h"
#include <verilated_fst_c.h>
#include "VVIP__Syms.h"


#define COLOR_LEVEL (WHITE_LEVEL - 20)
int ccmodI[CRT_CC_SAMPLES]; /* color phase for mod */
int ccmodQ[CRT_CC_SAMPLES]; /* color phase for mod */
int ccburst[CRT_CC_SAMPLES]; /* color phase for burst */

void (*sim_draw)();
Uint32 *screenPixels;
SDL_Texture *screen;
unsigned char *sim_video;
struct CRT *sim_crt;
static uint64_t vidTime = 0;
static int PhaseOffset = 1;
struct COLOR_SETTINGS {
    char *text[8];
    uint8_t index;
    int Amplitude[8];
    int Phase[8];
    int PhaseAmp[8];
};

static COLOR_SETTINGS colors;

VerilatedFstC* m_trace;
VVIP__Syms *VIP_Syms;
VVIP *VIP;

Uint64 main_time=0;
Uint64 main_trace=0;
Uint8 trace=1;


Uint8 rom[0x4000];
Uint8 ram[0x8000];

Uint8 Display_Edge=0;
Uint8 HSync_Edge=0;
Uint8 VSync_Edge=0;
Uint8 Ready_Edge=0;
Uint8 Burst_Edge=0;
Uint8 Video_Last=0; 
Uint8 MW_Last=0;
Uint8 MR_Last=0;
Uint8 P_Last=0;
Uint16 R3_Last=0;
Uint16 ADDR_Last=0;
Uint8 colorBurst=1;

Uint16 drawX, drawY, scanX;

Uint16 FrameCount = 0;
Uint16 FrameCurent = 0;

Uint64 ticksLast = 0;
char tmpstr[64];


int loadFile(const char *filename, Uint8 *pointer, const Uint32 len)
{
    FILE *fp = fopen(filename, "r");
    if ( fp == 0 )
    {
        printf( "Could not open file\n" );
        return -1;
    }

    fseek(fp, 0L, SEEK_END);
    Uint32 fsize = ftell(fp);
    fseek(fp, 0L, SEEK_SET);

    if(fsize > len){
        printf("File is to big!\n");
        fsize = len;
    }

    size_t s = fread(pointer, 1, fsize, fp);
    fclose(fp);

    return s;
}

int saveFile(const char *filename, Uint8 *pointer, const Uint32 len)
{
    FILE *fp = fopen(filename, "w+");
    if ( fp == 0 )
    {
        printf( "Could not open file\n" );
        return -1;
    }
    size_t s = fwrite(pointer, 1, len, fp);
    fclose(fp);

    return 0;
}

void genIQ()
{
    int sn, cs, n;
    for (int x = 0; x < CRT_CC_SAMPLES; x++) {
        n = x * (360 / CRT_CC_SAMPLES);
        crt_sincos14(&sn, &cs, (n + 33) * 8192 / 180);
        ccburst[x] = sn >> 10;
        crt_sincos14(&sn, &cs, n * 8192 / 180);
        ccmodI[x] = sn >> 10;
        crt_sincos14(&sn, &cs, (n - 90) * 8192 / 180);
        ccmodQ[x] = sn >> 10;
    }
}

void sim_init(unsigned char *v, SDL_Texture *td, void (*d)(), struct CRT *c){
    //screenPixels = p;
    sim_draw = d;
    screen = td;
    sim_video = v;
    sim_crt = c;

    SDL_UpdateTexture(screen, NULL, screenPixels, 240 * sizeof(Uint32));
    sim_draw();

    printf("Started.\n");
    genIQ();
    loadFile("../data/vip.rom", rom, 0x3fff);
    loadFile("../data/test_1861.bin", ram, 0x100);
    VIP = new VVIP();

	#ifdef TRACE
		Verilated::traceEverOn(true);
		m_trace = new VerilatedFstC;
		VIP->trace(m_trace, 99);
		m_trace->open ("simx.fst");
	#endif

    printf("CRT_INPUT_SIZE: %i\n", CRT_INPUT_SIZE);
}

void sim_keyevent(int key){
    if (key == SDLK_9 && colors.index > 0) {
        colors.index -= 1;
        printf("Index:%i\n", colors.index);
    }
    if (key == SDLK_0 && colors.index < 8) {
        colors.index += 1;
        printf("Index:%i\n", colors.index);
    }
    if (key == SDLK_o) {
        colors.Amplitude[colors.index] -= 1000;
        printf("Amplitude[%u]:%i\n",colors.index, colors.Amplitude[colors.index]);
    }
    if (key == SDLK_p) {
        colors.Amplitude[colors.index] += 1000;
        printf("Amplitude[%u]:%i\n",colors.index, colors.Amplitude[colors.index]);
    }
    if (key == SDLK_k) {
        colors.Phase[colors.index]-= 50;
        printf("Phase[%u]:%i\n",colors.index, colors.Phase[colors.index]);
    }
    if (key == SDLK_l) {
        colors.Phase[colors.index]+= 50;
        printf("Phase[%u]:%i\n",colors.index, colors.Phase[colors.index]);
    }
    if (key == SDLK_n) {
        colors.PhaseAmp[colors.index]-= 50;
        printf("PhaseAmp[%u]:%i\n",colors.index, colors.PhaseAmp[colors.index]);
    }
    if (key == SDLK_m) {
        colors.PhaseAmp[colors.index]+= 50;
        printf("PhaseAmp[%u]:%i\n",colors.index, colors.PhaseAmp[colors.index]);
    }
}

Uint32 colorsRGB[]={
    0x00000000,
    0x0000FF00,
    0x000000FF,
    0x0000FFFF,
    0x00FF0000,
    0x00FFFF00,
    0x00FF00FF,
    0x00FFFFFF,
};

void doNTSC(int CompSync, int Video)
{	
    int ire = -40, fi, fq, fy;
    int pA;
    int rA, gA, bA;
    int rB = 127, gB = 127, bB = 127;
	if(CompSync) ire=BLANK_LEVEL;
	if(Video) ire=WHITE_LEVEL;

    uint32_t i;
    int xoff;
    for (i = ns2pos(vidTime); i < ns2pos(vidTime+DOT_ns); i++)
    {
        //xoff = i % CRT_CC_SAMPLES;
        // if(Burst) ire = ccburst[(i + 0) & 3];
        
        // if(Color > 0) {
        //     ire = BLACK_LEVEL ;

        //     pA = colorsRGB[Color];
        //     bA = (pA >> 16) & 0xff;
        //     gA = (pA >>  8) & 0xff;
        //     rA = (pA >>  0) & 0xff;

        //     fy = (19595 * rA + 38470 * gA +  7471 * bA) >> 14;
        //     fi = (39059 * rA - 18022 * gA - 21103 * bA) >> 14;
        //     fq = (13894 * rA - 34275 * gA + 20382 * bA) >> 14;

        //     fy = fy;
        //     fi = fi * ccmodI[xoff] >> 4;
        //     fq = fq * ccmodQ[xoff] >> 4;
        //     ire += (fy + fi + fq) * (WHITE_LEVEL * 100 / 100) >> 10;
        //     if (ire < 0)   ire = 0;
        //     if (ire > 110) ire = 110;
        // }
        sim_crt->analog[i] = ire;
    }

    vidTime+=DOT_ns;
	return;
}

void sim_run(){
    VIP->reset = !(main_time>10);
    VIP->io_reset = (main_time>20);
    VIP->io_Start = (main_time>20);
    VIP->io_Wait = (main_time>20);
    VIP->io_keypad_col = 0xFF;
    if(VIP->io_Pixie_VSync && !VSync_Edge){
        sim_draw();
        sprintf(tmpstr,"Frames/Frame%04i.png",FrameCount++);
        Uint64 ticks = SDL_GetTicks64();
        //printf("Frame: %i\n", FrameCount);
        ticksLast = ticks;
        screenshot(tmpstr);
        vidTime = 0;
        memset(sim_crt->analog, 0, CRT_INPUT_SIZE); 
    }
    doNTSC(VIP->io_sync, VIP->io_video);
    VIP->io_rom_data = rom[VIP->io_rom_addr];

    VIP->io_ram_din = ram[VIP->io_ram_addr];
    if(VIP->io_ram_wr && main_time > 11) ram[VIP->io_ram_addr] = VIP->io_ram_dout;

    VSync_Edge = VIP->io_Pixie_VSync;
    HSync_Edge = VIP->io_Pixie_HSync;
    Video_Last = VIP->io_video;
    main_time++;
    VIP->clk = 1;
    VIP->eval();

    #ifdef TRACE
        if(trace){
            main_trace++;
            m_trace->dump (main_trace);
        }
    #endif

    main_time++;
    VIP->clk = 0;
    VIP->eval();

    #ifdef TRACE
        if(trace){
            main_trace++;
            m_trace->dump (main_trace);
        }
    #endif
}

void sim_end()
{
    printf("Ended.\n");
    VIP->final();
    saveFile("test.bin", ram, 0x8000);
    #ifdef TRACE
        m_trace->close();
    #endif
}