


                             README

             (C)Microform AB 1997 with permission from

                   Pertti Skillermark, SAAB Sweden

        ============================================================

        Instructions for the fighters demo application.


        Introduction
        ------------
        The fighters demo application demonstrates how to import
        surface geometry and how to visualise using views, colors
        and lights. The surfaces were originally modelled by Pertti
        Skillermark at SAAB Military Aircraft in Linköping, Sweden
        and has been made available to us with his permission.

        In order to save space the surfaces have been converted from
        the standard VDA-FS format to a format used by the NMG-system
        developed by British Aerospace. The NMG format only requires
        10% of the space of the VDA-FS format. The NMG-formatted files
        (*.F07) reside in the job-directory. A few of the surfaces are
        defined as VARKON native surfaces by the int_mot()-module in
        the lib-directory. The MBS source code is included in the
        mbs-directory.

        Note! You need VARKON 1.4G released 1997-04-14 or later to run
              the fighters demo.

        Installation
        ------------
        The fighters demo can not be installed without first installing the
        VARKON system. With VARKON installed on your disc, install the
        fighters demo in the $VARKON_PRD directory of the VARKON system.

        The fighters demo can not be installed without first installing the 
        VARKON system. With VARKON installed on your disc, install the 
        fighters demo in the same directory as you installed the VARKON
        system (usually C:\VARKON) by running the FIGHTERS.EXE program.
 
        The fighters application is designed according to the rules of a
        standard VARKON application. It contains the following standard
        directories:

          mbs - Source MBS-code for modules
          lib - Sources compiled into MBO-modules
          mdf - Menufiles
          doc - Help files
          sym - empty
          job - Files created by the application

        It also contains this README file.


        Usage
        -----
        With this done you can now start varkon. There is no PID-file
        included in FIGHTERS.EXE but VARKON will create one for you
        automatically if you enter "fighters" as the project name when
        the "select project" window is displayed during startup.

        There is one job included in the demo called su_27. Run su_27
        and all the surfaces will be imported. Try the "shade"-button
        in the toolbar to see the shaded image. Try the "view"-button
        to select another view. The view named nose_z is created by
        the su_27 module when you run it. Try the "MBS"-button to see
        the MBS-code of the su_27 module.

        
                                          Good Luck
                                          Microform AB
