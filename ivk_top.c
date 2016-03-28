//----------------------------------------------------------------
//      _____
//     /     \
//    /____   \____
//   / \===\   \==/
//  /___\===\___\/  AVNET
//       \======/
//        \====/    
//---------------------------------------------------------------
//
// This design is the property of Avnet.  Publication of this
// design is not authorized without written consent from Avnet.
// 
// Please direct any questions to:  technical.support@avnet.com
//
// Disclaimer:
//    Avnet, Inc. makes no warranty for the use of this code or design.
//    This code is provided  "As Is". Avnet, Inc assumes no responsibility for
//    any errors, which may appear in this code, nor does it make a commitment
//    to update the information contained herein. Avnet, Inc specifically
//    disclaims any implied warranties of fitness for a particular purpose.
//                     Copyright(c) 2010 Avnet, Inc.
//                             All rights reserved.
//
//----------------------------------------------------------------
//
// Create Date:         Jan 18, 2010
// Design Name:         IVK
// Module Name:         ivk_top.c
// Project Name:        IVK
// Target Devices:      Spartan-6
// Avnet Boards:        FMC-DVI/DP
//
// Tool versions:       ISE 11.4
//
// Description:         IVK Top Level Menu
//                      - based on vsk_top.c
//                      - modified as follows:
//                         - renamed to ivk_top
//                         - modified for IVK hardware
//
// Dependencies:        
//
// Revision:            Jan 18, 2010: 1.00 Initial version
//                      Mar 17, 2010: 1.02 Add arguments to tfp403/tfp410 config routines
//
//----------------------------------------------------------------


// DISCLAIMER OF LIABILITY
// 
// This text/file contains proprietary, confidential
// information of Xilinx, Inc., is distributed under license
// from Xilinx, Inc., and may be used, copied and/or
// disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc. Xilinx hereby grants you a 
// license to use this text/file solely for design, simulation, 
// implementation and creation of design files limited 
// to Xilinx devices or technologies. Use with non-Xilinx 
// devices or technologies is expressly prohibited and 
// immediately terminates your license unless covered by
// a separate agreement.
//
// Xilinx is providing this design, code, or information 
// "as-is" solely for use in developing programs and 
// solutions for Xilinx devices, with no obligation on the 
// part of Xilinx to provide support. By providing this design, 
// code, or information as one possible implementation of 
// this feature, application or standard, Xilinx is making no 
// representation that this implementation is free from any 
// claims of infringement. You are responsible for 
// obtaining any rights you may require for your implementation. 
// Xilinx expressly disclaims any warranty whatsoever with 
// respect to the adequacy of the implementation, including 
// but not limited to any warranties or representations that this
// implementation is free from claims of infringement, implied 
// warranties of merchantability or fitness for a particular 
// purpose.
//
// Xilinx products are not intended for use in life support
// appliances, devices, or systems. Use in such applications is
// expressly prohibited.
//
// Any modifications that are made to the Source Code are 
// done at the user’s sole risk and will be unsupported.
//
//
// Copyright (c) 2007, 2008 Xilinx, Inc. All rights reserved.
//
// This copyright and support notice must be retained as part 
// of this text at all times. 
//
//******************************************************************************/
// Filename            : vsk_top.c
// $Revision:: 4460   $: Revision of last commit
// $Date:: 2008-11-06#$: Date of last commit
// Description         : Top-level c file for DVI Pass-Through Demo
//******************************************************************************/
 
#include <stdio.h>
#include <stdlib.h>

// Located in: microblaze_0/include/
#include "xutil.h"
#include "xparameters.h"
#include "xstatus.h"

#include "ivk_iic_diag.h"
#include "ivk_dvi_edid.h"
#include "ivk_video_resolution.h"
#include "ivk_camera_menu.h"
#include "gamma.h"
#include "fir_2d.h"

#include "fmc_iic.h"
fmc_iic_t fmc_ipmi_iic;
fmc_iic_t fmc_dvidp_iic;

#include "fmc_ipmi.h"

//#include "fmc_dvidp.h"
//#include "fmc_dvidp_edid.h"
//fmc_dvidp_t fmc_dvidp;
#include "fmc_imageov.h"
fmc_imageov_t fmc_imageov;

static void help_top(void);

#define CAMERA_RESOLUTION  VIDEO_RESOLUTION_720P
//#define CAMERA_RESOLUTION  VIDEO_RESOLUTION_VGA

// Functions copied from vsk_util.c
void usec_wait(Xint32 delay);
void set_dcm_0_reset();
void release_dcm_0_reset();

XStatus main (void) {
  Xint32 inchar;
  Xint32 inchar1;
  Xint32 input;
  Xint32 resolution = -1;

  // Add for camera
  Xuint32 camera_select = 1;
  Xint32 resolution = CAMERA_RESOLUTION;

  Xuint32 bayer_phase = CFA_BAYER_PHASE_UPRIGHT;
  Xuint32 vertical_flip = 0, horizontal_flip = 0;

    
  // Use white on black for terminal color scheme
  print("\x1b[?5l\x1b[0m\x1b[H\x1b[J");
  
  // FMC-IIC Initialization
  //  if ( !fmc_iic_xps_init( &fmc_ipmi_iic,  "FMC_IPMI_I2C_CONTROLLER", XPAR_XPS_IIC_0_BASEADDR ) )
  //{
  //     exit(0);
  //  }
  //  if ( !fmc_iic_xps_init( &fmc_dvidp_iic, "FMC_DVIDP_I2C_CONTROLLER", XPAR_XPS_IIC_1_BASEADDR ) )
  //  {
  //    exit(0);
  //  }
   
  // FMC Module Validation
  //  if ( fmc_ipmi_detect( &fmc_ipmi_iic, "FMC-DVI/DP", FMC_ID_SLOT2 ) )
  //  {
  //    fmc_ipmi_enable( &fmc_ipmi_iic, FMC_ID_SLOT2 );
  //  }
  //  else
  //  {
  //    fmc_ipmi_disable( &fmc_ipmi_iic, FMC_ID_SLOT2 );
  //    exit(0);
  //  }
  
  // Change to using Video
  if ( !fmc_iic_xps_init( &fmc_ipmi_iic,  "FMC_IPMI_I2C_CONTROLLER", XPAR_XPS_IIC_0_BASEADDR ) )
  {
     exit(0);
  }
#if defined(XPAR_SG_I2C_CONTROLLER_S6_PLBW_NUM_INSTANCES)
  if ( !fmc_iic_sg_init( &fmc_imageov_iic, "FMC_IMAGEOV_I2C_CONTROLLER", &SG_I2C_CONTROLLER_PLBW_ConfigTable[0], 10 ) )
#else
  if ( !fmc_iic_xps_init( &fmc_imageov_iic, "FMC_IMAGEOV_I2C_CONTROLLER", XPAR_XPS_IIC_1_BASEADDR ) )
#endif
  {
    exit(0);
  }
   
  // FMC Module Validation
  if ( fmc_ipmi_detect( &fmc_ipmi_iic, "FMC-IMAGEOV", FMC_ID_SLOT1 ) )
  {
    fmc_ipmi_enable( &fmc_ipmi_iic, FMC_ID_SLOT1 );
  }
  else
  {
    fmc_ipmi_disable( &fmc_ipmi_iic, FMC_ID_SLOT1 );
    exit(0);
  }
        
        
  // Reset and Initialize the FMC devices
  //  xil_printf("Reset and Initialize the FMC devices ...\n\r" );
  //  fmc_dvidp_init( &fmc_dvidp, "FMC-DVI/DP", &fmc_dvidp_iic );
  //  fmc_dvidp_iic_mux_reset( &fmc_dvidp );   
  //  fmc_dvidp_config_tfp403( &fmc_dvidp, FMC_DVIDP_TFP403_ENABLED, FMC_DVIDP_TFP403_OCK_INVERTED );
  //  fmc_dvidp_reset_tfp410( &fmc_dvidp );
  //  fmc_dvidp_config_tfp410( &fmc_dvidp, FMC_DVIDP_TFP410_ENABLED, FMC_DVIDP_TFP410_DESKEW_n1400ps );

  xil_printf("Reset and Initialize the FMC devices ...\n\r" );
  fmc_imageov_init( &fmc_imageov, "FMC-IMAGEOV", &fmc_imageov_iic );
  fmc_imageov_iic_mux_reset( &fmc_imageov );   
  fmc_imageov_config_cdce925( &fmc_imageov );
  fmc_imageov_config_cdce925_y4y5_freq( &fmc_imageov, FMC_IMAGEOV_FREQ_12_000_000);
  fmc_imageov_reset_tfp410( &fmc_imageov );
  fmc_imageov_config_tfp410( &fmc_imageov, FMC_IMAGEOV_TFP410_ENABLED, FMC_IMAGEOV_TFP410_DESKEW_n1400ps );

  // Check for and initialize Camera #1
  if (ivk_camera_present(1, 0) == 1) {
    print("Camera 1 detected.\r\n"); 
#if (CAMERA_RESOLUTION == VIDEO_RESOLUTION_720P)
    ivk_camera1_config(OV9710_CONFIG_720P30);
#else   
    ivk_camera1_config(OV9710_CONFIG_VGAP30);
#endif    
    camera_select = 1;
  } else if (ivk_camera_present(2, 0) == 1) {
    print("Camera 2 detected.\r\n"); 
#if (CAMERA_RESOLUTION == VIDEO_RESOLUTION_720P)
    ivk_camera2_config(OV9710_CONFIG_720P30);
#else    
    ivk_camera2_config(OV9710_CONFIG_VGAP30);
#endif    
    camera_select = 2;
  } else {
    print("Error: Camera not found.\r\n");
    exit(0);
  }


  // Detect input video resolution
  usec_wait(200000);
  resolution = ivk_vres_detect();
  ivk_vres_generate( resolution );
  if ( resolution == VIDEO_RESOLUTION_720P )
  {
     print("Video Resolution set to 720P\r\n");
     fmc_imageov_config_cdce925_y1_freq( &fmc_imageov, FMC_IMAGEOV_FREQ_74_250_000);
     print("Clock generator set to 74.25 MHz.\r\n");
  }
  else if ( resolution == VIDEO_RESOLUTION_VGA )
  {
     print("Video Resolution set to VGA\r\n");
     fmc_imageov_config_cdce925_y1_freq( &fmc_imageov, FMC_IMAGEOV_FREQ_25_175_000);
     print("Clock generator set to 25.175 MHz.\r\n");
  }
  else
  {
     print("Defaulting Video Resolution to 720P\r\n");
     fmc_imageov_config_cdce925_y1_freq( &fmc_imageov, FMC_IMAGEOV_FREQ_74_250_000);
     print("Clock generator set to 74.25 MHz.\r\n");
  }

  xil_printf("Detect TFP403 ...\n\r" );
  input = fmc_dvidp_detect_tfp403( &fmc_dvidp );
  if ( input )
  {
    xil_printf("\tDetected DVI input ...\n\r" );
    resolution = ivk_vres_detect();
  }

  // Reset input clock DCM ???
  set_dcm_0_reset();
  usec_wait(200000);
  release_dcm_0_reset();
  
  // Initialize the 2-D FIR
  ivk_disable_fir_2d_coef_update();
  ivk_load_fir_2d_gain(0);          // unity gain
  ivk_load_fir_2d_coefficients(0);  // identity filter
  ivk_enable_fir_2d_coef_update();
  
  // Initialize the Gammas
  ivk_load_gamma_in_coefficients(0);  // Gamma(1)
  ivk_load_gamma_out_coefficients(0); //Gamma(1)

  // Wait for user to continue
  print("\r\n---- Press Any Key To Continue ----\r\n");
  inbyte(); 
  
  help_top();

  while (1)
  {
    print(">");
    
    inchar = inbyte(); 
    
    xil_printf("%c\n\r",inchar);

    switch (inchar)
	{
      case '?' : 
      {
        help_top(); 
        break;
      }

      case 'q' : 
      {
        xil_printf("exit\n\r");
        return(0);
        break;
      }

      // IIC Diagnostics Menu
      case 'i' : 
      {
        ivk_iic_diag_main( &fmc_dvidp );
        help_top();
        break;
      }

      // Camera menu
      case 'c' : 
      {
        ivk_camera_menu(camera_select); 
        help_top();
        break;
      }

      // GAMMA Menu
      case'g' : 
      {
        ivk_gamma_main();
        help_top();
        break;
      }

      // 2D FIR menu
      case 'f' : 
      {
        ivk_fir_2d_main(); 
        help_top();
        break;
      }

	  // Video Resolution
      case 'v':
      {
         resolution = ivk_vres_detect();
         break;
      }      

      // Read DVI_OUT EDID PROM     
//      case 'o' :
//      {
//        ivk_dvi_out_edid_read( &fmc_dvidp );
//        break;
//      }
//      // Read DVI_IN EDID PROM    
//      case 'e' :
//      {
//        ivk_dvi_in_edid_read( &fmc_dvidp );
//        break;
//      }
//      // Program DVI_IN EDID PROM    
//      case 'E' :
//      {
//        ivk_dvi_in_edid_program( &fmc_dvidp );
//        break;
//      }
//        
    }
  }
	return 0;
} //main


static void help_top(void)
{
  print("\n\r");
  print("-----------------------------------------------------\n\r");
  print("--    Spartan-6 Industrial Video Processing Kit    --\n\r");
  print("--             DVI Video Processing Demo           --\n\r");
  print("-----------------------------------------------------\n\r");
  print("\n\r");
  print(" Video Resolution\n\r");
  print(" v = Detect Video Resolution\n\r" );
  print("\n\r");
  print(" Video Processing Menus\n\r");
  print(" g = Gamma Menu  \n\r");
  print(" f = 2D FIR Menu \n\r");
  print("\n\r");
  print(" i = IIC Diagnostics Menu  \n\r");
  print("\n\r");
  print(" o = Read DVI_OUT EDID PROM \n\r");
  print(" e = Read DVI_IN EDID PROM \n\r");
  print(" E = Program DVI_IN EDID PROM \n\r");
  print("\n\r");
  print(" ? = help \n\r");
  print("-----------------------------------------------------\n\r");
}


/***********************************************************************
* Wait the specified number of microseconds
*
* @param    None.
*
* @return   None. 
*
* @note     Calibrated at 100MHz CPU clock using scope, 
*            should work for any CPU speed
*
***********************************************************************/
void usec_wait(Xint32 delay) {
	Xint32 val = delay * (Xint32)( (XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ * 17) / 100000000 );
	while(val--) 
		asm("nop");
}

/***********************************************************************
* This function puts the DCM_0 PCORE into reset
*
* @param    None.
*
* @return   None. 
*
* @note     None.
*
***********************************************************************/
void set_dcm_0_reset( void )
{
   Xuint32 value;

   fmc_ipmi_iic.fpGpoRead( &fmc_ipmi_iic, &value );
   value = value | 0x00000004; // Force bit 2 to 1
   fmc_ipmi_iic.fpGpoWrite( &fmc_ipmi_iic, value );
}

/***********************************************************************
* This function releases the DCM_0 PCORE from reset
*
* @param    None.
*
* @return   None. 
*
* @note     None.
*
***********************************************************************/
void release_dcm_0_reset( void )
{
   Xuint32 value;

   fmc_ipmi_iic.fpGpoRead( &fmc_ipmi_iic, &value );
   value = value & ~0x00000004; // Force bit 2 to 0
   fmc_ipmi_iic.fpGpoWrite( &fmc_ipmi_iic, value );
}

