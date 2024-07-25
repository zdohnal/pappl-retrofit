
#
# This file is not needed for review, and is only used for the
# shell API plugin. No need to modify it or anything.
#

declare -f +x module
PATH=/bin:/usr/bin:/sbin/:/usr/sbin

declare -A FR_FLAGS
FR_FLAGS[EXARCH]=''
FR_FLAGS[EPEL6]=''
FR_FLAGS[EPEL7]=''
FR_FLAGS[DISTTAG]=''
FR_FLAGS[BATCH]=''

declare -A FR_SETTINGS 
FR_SETTINGS[bz_url]="https://bugzilla.redhat.com"
FR_SETTINGS[log]="<RootLogger root (DEBUG)>"
FR_SETTINGS[cache]=""
FR_SETTINGS[resultdir]=""
FR_SETTINGS[init_done]="True"
FR_SETTINGS[uniqueext]=""
FR_SETTINGS[configdir]=""
FR_SETTINGS[log_level]="20"
FR_SETTINGS[prebuilt]=""
FR_SETTINGS[verbose]=""
FR_SETTINGS[name]="pappl-retrofit"
FR_SETTINGS[use_colors]="True"
FR_SETTINGS[session_log]="/home/zdohnal/.cache/fedora-review.log"
FR_SETTINGS[bug]=""
FR_SETTINGS[url]=""
FR_SETTINGS[copr_build_descriptor]=""
FR_SETTINGS[list_checks]=""
FR_SETTINGS[list_flags]=""
FR_SETTINGS[list_plugins]=""
FR_SETTINGS[version]=""
FR_SETTINGS[flags]=""
FR_SETTINGS[repo]=""
FR_SETTINGS[mock_config]="fedora-rawhide-x86_64"
FR_SETTINGS[no_report]=""
FR_SETTINGS[nobuild]=""
FR_SETTINGS[mock_options]="--no-cleanup-after --no-clean"
FR_SETTINGS[other_bz]=""
FR_SETTINGS[plugins_arg]=""
FR_SETTINGS[single]=""
FR_SETTINGS[rpm_spec]="True"
FR_SETTINGS[exclude]=""
FR_SETTINGS[checksum]="sha256"
FR_SETTINGS[plugins]=""

export FR_REVIEWDIR='/home/zdohnal/repo_upstream/pappl-retrofit/review/pappl-retrofit'
export HOME=$FR_REVIEWDIR
cd $HOME

export FR_NAME='pappl-retrofit'
export FR_VERSION='1.0b2'
export FR_RELEASE='2.fc41'
export FR_GROUP='Unspecified'
export FR_LICENSE='Apache-2.0 WITH LLVM-exception'
export FR_URL='https://github.com/OpenPrinting/pappl-retrofit/'

export Source0="https://github.com/OpenPrinting/pappl-retrofit//releases/download/1.0b2/pappl-retrofit-1.0b2.tar.gz"

export Patch4="0001-Add-configure-options-for-several-PAPPL-options-22.patch"
export Patch3="pappl-retrofit-use-after-free.patch"
export Patch2="0001-Added-man-page-for-the-Legacy-Printer-Application.patch"
export Patch1="0001-pappl-retrofit-private.h-Add-include-cups-sidechanne.patch"


export FR_PREP='cd '\''/home/zdohnal/rpmbuild/BUILD'\''
rm -rf '\''pappl-retrofit-1.0b2'\''
/usr/lib/rpm/rpmuncompress -x '\''/home/zdohnal/rpmbuild/SOURCES/pappl-retrofit-1.0b2.tar.gz'\''
STATUS=$?
if [ $STATUS -ne 0 ]; then
exit $STATUS
fi
cd '\''pappl-retrofit-1.0b2'\''
rm -rf '\''/home/zdohnal/rpmbuild/BUILD/pappl-retrofit-1.0b2-SPECPARTS'\''
/usr/bin/mkdir -p '\''/home/zdohnal/rpmbuild/BUILD/pappl-retrofit-1.0b2-SPECPARTS'\''
/usr/bin/chmod -Rf a+rX,u+w,g-w,o-w .
/usr/bin/git init -q
/usr/bin/git config user.name "rpm-build"
/usr/bin/git config user.email "<rpm-build>"
/usr/bin/git config gc.auto 0
/usr/bin/git add --force .
/usr/bin/git commit -q --allow-empty -a\
--author "rpm-build <rpm-build>" -m "pappl-retrofit-1.0b2 base"
/usr/bin/git checkout --track -b rpm-build
echo '\''Cannot read /home/zdohnal/rpmbuild/SOURCES/0001-pappl-retrofit-private.h-Add-include-cups-sidechanne.patch'\''; exit 1;
echo '\''Cannot read /home/zdohnal/rpmbuild/SOURCES/0001-Added-man-page-for-the-Legacy-Printer-Application.patch'\''; exit 1;
echo '\''Cannot read /home/zdohnal/rpmbuild/SOURCES/pappl-retrofit-use-after-free.patch'\''; exit 1;
echo '\''Cannot read /home/zdohnal/rpmbuild/SOURCES/0001-Add-configure-options-for-several-PAPPL-options-22.patch'\''; exit 1;
./autogen.sh'
export FR_BUILD='
CFLAGS="${CFLAGS:--O2 -flto=auto -ffat-lto-objects -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer }" ; export CFLAGS ;
CXXFLAGS="${CXXFLAGS:--O2 -flto=auto -ffat-lto-objects -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer }" ; export CXXFLAGS ;
FFLAGS="${FFLAGS:--O2 -flto=auto -ffat-lto-objects -fexceptions -g -grecord-gcc-switches -pipe -Wall -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -I/usr/lib64/gfortran/modules }" ; export FFLAGS ;
FCFLAGS="${FCFLAGS:--O2 -flto=auto -ffat-lto-objects -fexceptions -g -grecord-gcc-switches -pipe -Wall -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -I/usr/lib64/gfortran/modules }" ; export FCFLAGS ;
VALAFLAGS="${VALAFLAGS:--g}" ; export VALAFLAGS ;
RUSTFLAGS="${RUSTFLAGS:--Copt-level=3 -Cdebuginfo=2 -Ccodegen-units=1 -Cstrip=none -Cforce-frame-pointers=yes -Clink-arg=-specs=/usr/lib/rpm/redhat/redhat-package-notes --cap-lints=warn}" ; export RUSTFLAGS ;
LDFLAGS="${LDFLAGS:--Wl,-z,relro -Wl,--as-needed  -Wl,-z,pack-relative-relocs -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -specs=/usr/lib/rpm/redhat/redhat-package-notes }" ; export LDFLAGS ;
LT_SYS_LIBRARY_PATH="${LT_SYS_LIBRARY_PATH:-/usr/lib64:}" ; export LT_SYS_LIBRARY_PATH ;
CC="${CC:-gcc}" ; export CC ;
CXX="${CXX:-g++}" ; export CXX;
[ "-flto=auto -ffat-lto-objects"x != x ] &&
for file in $(find . -type f -name configure -print); do
/usr/bin/sed -r --in-place=.backup '\''s/^char \(\*f\) \(\) = /__attribute__ ((used)) char (*f) () = /g'\'' $file;
diff -u $file.backup $file && mv $file.backup $file
/usr/bin/sed -r --in-place=.backup '\''s/^char \(\*f\) \(\);/__attribute__ ((used)) char (*f) ();/g'\'' $file;
diff -u $file.backup $file && mv $file.backup $file
/usr/bin/sed -r --in-place=.backup '\''s/^char \$2 \(\);/__attribute__ ((used)) char \$2 ();/g'\'' $file;
diff -u $file.backup $file && mv $file.backup $file
/usr/bin/sed --in-place=.backup '\''1{$!N;$!N};$!N;s/int x = 1;\nint y = 0;\nint z;\nint nan;/volatile int x = 1; volatile int y = 0; volatile int z, nan;/;P;D'\'' $file;
diff -u $file.backup $file && mv $file.backup $file
/usr/bin/sed --in-place=.backup '\''s#^lt_cv_sys_global_symbol_to_cdecl=.*#lt_cv_sys_global_symbol_to_cdecl="sed -n -e '\''"'\''"'\''s/^T .* \\(.*\\)$/extern int \\1();/p'\''"'\''"'\'' -e '\''"'\''"'\''s/^$symcode* .* \\(.*\\)$/extern char \\1;/p'\''"'\''"'\''"#'\'' $file;
diff -u $file.backup $file && mv $file.backup $file
done;
[ "1" = 1 ] && for i in $(find $(dirname ./configure) -name config.guess -o -name config.sub) ; do
[ -f /usr/lib/rpm/redhat/$(basename $i) ] && /usr/bin/rm -f $i && /usr/bin/cp -fv /usr/lib/rpm/redhat/$(basename $i) $i ;
done ;
[ "1" = 1 ] && [ x != "x-Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld" ] &&
for i in $(find . -name ltmain.sh) ; do
/usr/bin/sed -i.backup -e '\''s~compiler_flags=$~compiler_flags="-Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld"~'\'' $i
done ;
./configure --build=x86_64-redhat-linux --host=x86_64-redhat-linux \
--program-prefix= \
--disable-dependency-tracking \
\
--prefix=/usr \
--exec-prefix=/usr \
--bindir=/usr/bin \
--sbindir=/usr/sbin \
--sysconfdir=/etc \
--datadir=/usr/share \
--includedir=/usr/include \
--libdir=/usr/lib64 \
--libexecdir=/usr/libexec \
--localstatedir=/var \
$(grep -q "runstatedir=DIR" ./configure && echo '\''--runstatedir=/run'\'') \
--sharedstatedir=/var/lib \
--mandir=/usr/share/man \
--infodir=/usr/share/info --enable-legacy-printer-app-as-daemon\
--enable-shared\
--disable-static\
--disable-silent-rules\
--with-auth-service=password-auth\
--with-server-options=multi-queue,web-interface,raw-socket,web-network,web-remote,web-security,web-tls
sed -i -e '\''s! -shared ! -Wl,--as-needed\0!g'\'' libtool
/usr/bin/make -O -j${RPM_BUILD_NCPUS} V=1 VERBOSE=1'
export FR_INSTALL='/usr/bin/make install DESTDIR=/home/zdohnal/rpmbuild/BUILDROOT/pappl-retrofit-1.0b2-2.fc40.x86_64 INSTALL="/usr/bin/install -p"
# Remove license files from doc
rm -f /home/zdohnal/rpmbuild/BUILDROOT/pappl-retrofit-1.0b2-2.fc40.x86_64//usr/share/doc/pappl-retrofit/{LICENSE,NOTICE,COPYING}'

declare -A FR_FILES
FR_FILES[pappl-retrofit]='%license LICENSE NOTICE COPYING
%doc AUTHORS README.md
/usr/lib64/libpappl-retrofit.so.1
/usr/lib64/libpappl-retrofit.so.1.0.0'
FR_FILES[pappl-retrofit-devel]='/usr/share/doc/pappl-retrofit/CONTRIBUTING.md
/usr/share/doc/pappl-retrofit/DEVELOPING.md
/usr/include/pappl-retrofit.h
/usr/lib64/libpappl-retrofit.so
/usr/lib64/pkgconfig/libpappl-retrofit.pc'
FR_FILES[legacy-printer-app]='/usr/sbin/legacy-printer-app
/usr/lib/systemd/system/legacy-printer-app.service
%dir /usr/share/legacy-printer-app
/usr/share/legacy-printer-app/testpage.ps
/usr/share/legacy-printer-app/testpage.pdf
/usr/lib64/legacy-printer-app
/usr/share/man/man1/legacy-printer-app.1.gz'
FR_FILES[pappl-retrofit-debuginfo]=''
FR_FILES[pappl-retrofit-debugsource]=''

declare -A FR_DESCRIPTION


export FR_FILES FR_DESCRIPTION

export FR_PASS=80
export FR_FAIL=81
export FR_PENDING=82
export FR_NOT_APPLICABLE=83


function get_used_rpms()
# returns (stdout) list of used rpms if found, else returns 1
{
    cd $FR_REVIEWDIR
    if test  "${FR_SETTINGS[prebuilt]}" = True
    then
        files=( $(ls ../*.rpm 2>/dev/null | grep -v .src.rpm) )                || files=( '@@' )
    else
        files=( $(ls results/*.rpm 2>/dev/null | grep -v .src.rpm) )                || files=( '@@' )
    fi
    test -e ${files[0]} || return 1
    echo "${files[@]}"
    cd $OLDPWD
}

function unpack_rpms()
# Unpack all non-src rpms in results into rpms-unpacked, one dir per rpm.
{
    [ -d rpms-unpacked ] && return 0
    rpms=( $( get_used_rpms ) ) || return 1
    mkdir rpms-unpacked
    cd rpms-unpacked
    retval=0
    for rpm_path in ${rpms[@]};  do
        rpm=$( basename $rpm_path)
        mkdir $rpm
        cd $rpm
        rpm2cpio ../../$rpm_path | cpio -imd &>/dev/null
        cd ..
    done
    cd ..
}

function unpack_sources()
# Unpack sources in upstream into upstream-unpacked
# Ignores (reuses) already unpacked items.
{
    sources=( $(cd upstream; ls) ) || sources=(  )
    if [[ ${#sources[@]} -eq 0 || ! -e "upstream/${sources[0]}" ]]; then
       return $FR_NOT_APPLICABLE
    fi
    for source in "${sources[@]}"; do
        mkdir upstream-unpacked/$source 2>/dev/null || continue
        rpmdev-extract -qfC  upstream-unpacked/$source upstream/$source ||            cp upstream/$source upstream-unpacked/$source
    done
}

function attach()
# Usage: attach <sorting hint> <header>
# Reads attachment from stdin
{
    startdir=$(pwd)
    cd $FR_REVIEWDIR
    for (( i = 0; i < 10; i++ )); do
        test -e $FR_REVIEWDIR/.attachments/*$i || break
    done
    if [ $i -eq 10 ]; then
        echo "More than 10 attachments! Giving up" >&2
        exit 1
    fi
    sort_hint=$1
    shift
    title=${*//\/ }
    file="$sort_hint;${title/;/:};$i"
    cat > .attachments/"$file"
    cd $startdir
}

