#!/usr/bin/env python
import sys,os.path,subprocess

base = os.path.abspath(os.path.dirname(__file__))

binaries = [
    'MOSEKLM',
    'libcilkrts.5.dylib',
    'libmosek64.8.1.dylib',
    'libmosek64.dylib',
    'libmosekjava8_1.jnilib',
    'libmosekscopt8_1.dylib',
    'libmosekxx8_1.dylib',
    'lmgrd',
    'lmutil',
    'mampl',
    'mosek',
    'moseksi',
    'mskdgopt',
    'mskexpopt',
    'mskscopt',
    'msktestlic',
    '../../../../toolbox/r2014a/mosekopt.mexmaci64',
    '../../../../toolbox/r2014aom/mosekopt.mexmaci64',
]


fixlibs = [ 'libmosek64','libcilkrts','libiomp5' ]

print("Fixing library paths")
for fname in binaries:
    fullname = os.path.join(base,fname)
    print("  %s:" % fname)
    try:
        text = subprocess.check_output(['otool','-L',fullname]).decode()
        for l in text.splitlines():
            p = l.find('(')
            if p > 0:
                libname = l[:p].strip()
                libbase = os.path.basename(libname)

                while True:
                    libbase,ext = os.path.splitext(libbase)
                    if not ext:
                        break
                if libbase in fixlibs:
                    abslibpath = os.path.join(base,os.path.basename(libname))
                    if abslibpath != libname:
                        print('    %s -> %s' % (libname,abslibpath))
                        with open('/dev/null','wb') as devnull:
                            subprocess.call(['install_name_tool','-change',libname,abslibpath,fullname],stdout=devnull)
    except:
        import traceback
        traceback.print_exc()
        pass
print("Done.")
