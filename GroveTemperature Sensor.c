/****************************************************************************
 *
 * Copyright 2016 Samsung Electronics All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific
 * language governing permissions and limitations under the License.
 *
 ****************************************************************************/
/****************************************************************************
 * examples/hello/hello_main.c
 *
 *   Copyright (C) 2008, 2011-2012 Gregory Nutt. All rights reserved.
 *   Author: Gregory Nutt <gnutt@nuttx.org>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 * 3. Neither the name NuttX nor the names of its contributors may be
 *    used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 ****************************************************************************/

/****************************************************************************
 * Included Files
 ****************************************************************************/
#include <stdio.h>
#include <apps/shell/tash.h>
#include <math.h>
#include "api.h"

/****************************************************************************
 * main
 ****************************************************************************/
static int cloud_message(char *temperature_data, int str_len)
{
	char *agrv_cmd[] = {"cloud_main",
			"message",
			"65219649e3964f1486baaa6e3d7b2ac4",
			"e3b5259fef2144e4abd7f3b2b1922978",
			""
	};

	agrv_cmd[4] = temperature_data;
	//fprintf(stdout, "%s\n", agrv_cmd[4]);
	cloud_main(5, agrv_cmd);

	return 0;
}

static double calc_temperature(void)
{
	int adc_temp;
	const double R0 = 100000.0;
	const double B = 4276.0; // value of the thermistor
	double r,t;

	char *agrv_cmd[] = {"adc_main",
			"read",
			"0"
	};

	adc_main(3, agrv_cmd);
	adc_temp = adc_get();
	r = 4095.0/((double)adc_temp)-1.0;
	//fprintf(stdout, "%lf %lf\n", r, B);
	r = R0*r;
	t = 1.0/(log(r/R0)/B+1.0/298.15)-273.15;

	return t;
}

int main(int argc, char *argv[])
{
	double room_temperature;
	char *temperature_string;
	int len;
	int flag = 1;

	StartWifiConnection();

	while(flag) {
		room_temperature = calc_temperature();

		//fprintf(stdout, "%.5f\n", room_temperature);

		len = snprintf(NULL, 0, "{\"currentTemp\":%.5f}", room_temperature);
		temperature_string = (char *)malloc(len + 1);
		snprintf(temperature_string, len + 1, "{\"currentTemp\":%.5f}", room_temperature);
		//fprintf(stdout, "%s\n", temperature_string);
		cloud_message(temperature_string, len+1);
		free(temperature_string);

		//flag  = 0;

		sleep(60);
	}

	//tash_cmd_install("test1", test1_main, TASH_EXECMD_SYNC);

	return 0;
}
