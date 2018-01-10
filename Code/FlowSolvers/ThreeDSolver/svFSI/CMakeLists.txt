##=========================================================================
 #
 # Copyright (c) 2014-2015 The Regents of the University of California.
 # All Rights Reserved.
 #
 # Permission is hereby granted, free of charge, to any person obtaining
 # a copy of this software and associated documentation files (the
 # "Software"), to deal in the Software without restriction, including
 # without limitation the rights to use, copy, modify, merge, publish,
 # distribute, sublicense, and/or sell copies of the Software, and to
 # permit persons to whom the Software is furnished to do so, subject
 # to the following conditions:
 #
 # The above copyright notice and this permission notice shall be included
 # in all copies or substantial portions of the Software.
 #
 # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 # IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 # TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 # PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 # OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 # PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 # PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 # LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 #
 #=========================================================================#


# executable variable is named in the variable 
# SV_SVFSI_EXE

# this uses fixed-form fortran
# so need to reset the flags 
# set(CMAKE_Fortran_FLAGS "-ffixed-form -cpp -pthread")

set(CMAKE_Fortran_FLAGS "-cpp -pthread")

set(FSRCS UTIL.f 
         COMU.f 
         CHNL.f 
         LIST.f 
         MOD.f 
         MATFUN.f 
         ALLFUN.f 
         BBO.f 
         BAFINI.f 
         CONSTRUCT.f 
         DISTRIBUTE.f 
         FFT.f 
         FLUID.f 
         HEAT.f 
         INITIALIZE.f 
         LELAS.f 
         LHSA.f 
         LOADMSH.f 
         LOADNRB.f 
         MAIN.f 
         MATMODELS.f 
         NN.f 
         NURBS.f 
         OUTPUT.f 
         PIC.f 
         POST.f 
         READFILES.f 
         READMSH.f 
         REMESH.f
         SETBC.f 
         STRUCT.f 
         TXT.f 
         VTKXML.f) 


set(F90SRCS vtkComMod.f90
         vtkTypeParams.f90
         vtkXMLParser.f90
         vtkLegacyParser.f90)
# set_source_files_properties(vtkTypeParams.f90 PROPERTIES COMPILE_FLAGS "-ffixed-line-length-132 -cpp -pthread")



# try this if problems with f90 
# F90SRCS

set(CSRCS vtkZpipe.c)

set(CXXSRCS remeshTet.cpp 
            remeshSim.cpp)


simvascular_add_executable(${SV_SVFSI_EXE}
  SRCS ${FSRCS}
  SRCS ${F90SRCS}
  SRCS ${CSRCS}
  SRCS ${CXXSRCS}
  DEV_SCRIPT_NAME "mysvfsi"
  INSTALL_SCRIPT_NAME "svfsi"
  INSTALL_COMP CoreExecutables
  INSTALL_DESTINATION ${SV_INSTALL_RUNTIME_DIR})

# hardcoded to include MPI here, so MPI is required until updated
target_link_libraries(${SV_SVFSI_EXE}
  ${GLOBAL_LIBRARIES}
  ${INTELRUNTIME_LIBRARIES}
  ${ZLIB_LIBRARY}
  ${METIS_SVFSI_LIBRARY_NAME}
  ${PARMETIS_SVFSI_LIBRARY_NAME}
  ${SV_MPI_EXTRA_LIBRARY}
  ${SV_MPI_Fortran_LIBRARIES}
  )

