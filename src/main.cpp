#include <mbed.h>

//Define Peripherals here.
Serial pc((PinName)PA_2, (PinName)PA_15, 115200);

//Low power timer enables stop mode.
LowPowerTimer timer;

//App Start

int main()
{
	timer.start();
	while(true)
	{
		pc.printf("Time Elapsed: %10f[sec]\n", timer.read());
		ThisThread::sleep_for(1000);
	}
}

//Comment this out if you dont want the blinking led on crash
void mbed_die(void)
{
	//
	core_util_critical_section_enter();
	while(1)
	{
		wait_us(SEC_TO_MS(30));
		NVIC_SystemReset();
	}
}