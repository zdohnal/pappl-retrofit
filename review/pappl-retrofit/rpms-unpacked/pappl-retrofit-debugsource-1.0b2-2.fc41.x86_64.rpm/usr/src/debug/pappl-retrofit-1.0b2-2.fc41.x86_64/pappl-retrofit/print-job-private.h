//
// PPD/Classic CUPS driver retro-fit Printer Application Library
// (libpappl-retrofit) for the Printer Application Framework (PAPPL)
//
// print-job-private.h
//
// Copyright © 2020 by Till Kamppeter.
// Copyright © 2020 by Michael R Sweet.
//
// Licensed under Apache License v2.0.  See the file "LICENSE" for more
// information.
//

#ifndef _PAPPL_RETROFIT_PRINT_JOB_H_
#  define _PAPPL_RETROFIT_PRINT_JOB_H_

//
// Include necessary headers...
//

#include <pappl-retrofit/pappl-retrofit.h>
#include <pappl/pappl.h>
#include <ppd/ppd.h>
#include <cupsfilters/log.h>
#include <cupsfilters/filter.h>
#include <cups/cups.h>
#include <signal.h>


//
// C++ magic...
//

#  ifdef __cplusplus
extern "C" {
#  endif // __cplusplus


//
// Types...
//

// Data for _prPrintFilterFunction()
typedef struct pr_print_filter_function_data_s 
                                        // look-up table
{
  pappl_device_t *device;                      // Device
  char           *device_uri;                  // Printer device URI
  pappl_job_t    *job;                         // Job
  pr_printer_app_global_data_t *global_data;   // Global data
} pr_print_filter_function_data_t;

typedef struct pr_job_data_s		// Job data
{
  char                  *device_uri;    // Printer device URI
  ppd_file_t            *ppd;           // PPD file loaded from collection
  char                  *temp_ppd_name; // File name of temporary copy of the
                                        // PPD file to be used by CUPS filters
  cf_filter_data_t         *filter_data;   // Common print job data for filter
                                        // functions
  char                  *stream_filter; // CUPS Filter to use when printing
                                        // in streaming mode (Raster input)
  pr_stream_format_t    *stream_format; // Filter sequence for streaming
                                        // raster input
  cups_array_t          *chain;         // Filter function chain
  cf_filter_filter_in_chain_t *ppd_filter, // Filter from PPD file
                        *print;         // Filter function call for printing
  int                   device_fd;      // File descriptor to pipe output
                                        // to the device
  int                   device_pid;     // Process ID for device output
                                        // sub-process
  FILE                  *device_file;   // File pointer for output to
                                        // device
  int                   line_count;     // Raster lines actually received for
                                        // this page
  void                  *data;          // Job-type-specific data
  pr_printer_app_global_data_t *global_data; // Global data
} pr_job_data_t;


//
// Functions...
//

extern void   _prASCII85(FILE *outputfp, const unsigned char *data, int length,
			 int last_data);
extern pappl_content_t _prGetFileContentType(pappl_job_t *job);
extern pr_job_data_t *_prCreateJobData(pappl_job_t *job,
					 pappl_pr_options_t *job_options);
extern bool   _prFilter(pappl_job_t *job, pappl_device_t *device, void *data);
extern void   _prFreeJobData(pr_job_data_t *job_data);
extern int    _prJobIsCanceled(void *data);
extern void   _prJobLog(void *data, cf_loglevel_t level,
			const char *message, ...);
extern void   _prOneBitDitherOnDraft(pappl_job_t *job,
				     pappl_pr_options_t *options);
extern void   _prCleanDebugCopies(pr_printer_app_global_data_t *global_data);
extern int    _prPrintFilterFunction(int inputfd, int outputfd,
				     int inputseekable, cf_filter_data_t *data,
				     void *parameters);
extern pr_job_data_t* _prRasterPrepareJob(pappl_job_t *job,
					  pappl_pr_options_t *options,
					  pappl_device_t *device,
					  char *starttype);
extern void   _prRasterCleanUpJob(pappl_job_t *job, pappl_device_t *device);


//
// C++ magic...
//

#  ifdef __cplusplus
}
#  endif // __cplusplus


#endif // !_PAPPL_RETROFIT_PRINT_JOB_H_
