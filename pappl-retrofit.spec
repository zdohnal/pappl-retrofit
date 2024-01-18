# the original SPEC file was created by Brandon Nielsen in his COPR repo and this comment
# is to honor his great contribution - thank you for all you work, Brandon!

%if 0%{?fedora}
%bcond_without mdns
%else
%bcond_with mdns
%endif

Name: libpappl-retrofit
Version: 1.0b2
Release: 1%{?dist}
# the CUPS exception text is the same as LLVM exception, so using that name with
# agreement from legal team
# https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/message/A7GFSD6M3GYGSI32L2FC5KB22DUAEQI3/
License: Apache-2.0 WITH LLVM-exception
Summary: Library for common functions used in retrofitting printer applications by OpenPrinting
URL: https://github.com/OpenPrinting/pappl-retrofit/
Source: %{URL}/releases/download/%{version}/pappl-retrofit-%{version}.tar.gz

# Patches
# FTBFS
# https://github.com/OpenPrinting/pappl-retrofit/commit/0317fae79ce
Patch001: 0001-pappl-retrofit-private.h-Add-include-cups-sidechanne.patch
# add man page
# https://github.com/OpenPrinting/pappl-retrofit/commit/33be36f28
Patch002: 0001-Added-man-page-for-the-Legacy-Printer-Application.patch


BuildRequires: autoconf
BuildRequires: automake
BuildRequires: gettext-devel
BuildRequires: gcc
BuildRequires: git-core
BuildRequires: make
BuildRequires: libtool
BuildRequires: pam-devel
# for pkg-config in configure and in SPEC file
BuildRequires: pkgconf-pkg-config
BuildRequires: pkgconfig(cups) >= 2.2.0
BuildRequires: pkgconfig(libcupsfilters) >= 2.0b2
BuildRequires: pkgconfig(libppd) >= 2.0b2
BuildRequires: pkgconfig(pappl) >= 1.1b2


%description
This library together with PAPPL and cups-filters 2.x allows to convert classic
CUPS printer drivers into Printer Applications. This way the printer appears as
an emulated IPP printer and one can print on it from practically any operating
system, especially also mobile operating systems and IoT platforms,
without need any client-side driver.

%package devel
Summary: Development environment for pappl-retrofit
Requires: %{name}%{?_isa} = %{version}-%{release}

%description devel
This package provides the pappl-retrofit headers and development environment.

%package -n legacy-printer-app
Summary: Legacy printer application
%if %{with mdns}
# Avahi has to run for mDNS support
Recommends: avahi
# if we go for mDNS, we need a resolver
Recommends: nss-mdns
%endif
# recommend CUPS, the daemon which usually picks up IPP services
Recommends: cups

Requires: %{name}%{?_isa} = %{version}-%{release}

Requires(post): systemd
Requires(preun): systemd
Requires(postun): systemd

%description -n legacy-printer-app
Legacy printer application provides support for classic printer drivers which are
not part of official Linux repositories - it enables possibility to set your printer
with proprietary printer drivers from manufacturers, so such printer will be seen
by CUPS.


%prep
%autosetup -S git


%build
%configure --enable-legacy-printer-app-as-daemon\
  --enable-shared\
  --disable-static\
  --disable-silent-rules

%make_build


%install
%make_install

# Remove absolute symlink
rm -f %{buildroot}/%{_libdir}/legacy-printer-app

%post
%systemd_post legacy-printer-app.service

%preun
%systemd_preun legacy-printer-app.service

%postun
%systemd_postun_with_restart legacy-printer-app.service

%files
%license LICENSE NOTICE
%{_libdir}/libpappl-retrofit.so.1
%{_libdir}/libpappl-retrofit.so.1.0.0

%files devel
%doc %{_docdir}/pappl-retrofit
%{_includedir}/pappl-retrofit.h
%{_libdir}/libpappl-retrofit.so
%{_libdir}/pkgconfig/libpappl-retrofit.pc

%files -n legacy-printer-app
%{_sbindir}/legacy-printer-app
%{_unitdir}/legacy-printer-app.service
%dir %{_datadir}/legacy-printer-app
%{_datadir}/legacy-printer-app/testpage.ps
%{_datadir}/legacy-printer-app/testpage.pdf

%changelog
* Thu Jan 18 2024 Zdenek Dohnal <zdohnal@redhat.com> 1.0b2-2
- initial import

* Mon Sep 18 2023 Brandon Nielsen <nielsenb@jetfuse.net> 1.0b2-1
- Update to 1.0b2
- Change to SPDX license identifier
- Enable the legacy printer app as a daemon

* Thu Feb 2 2023 Brandon Nielsen <nielsenb@jetfuse.net> 1.0b1-1
- Update to 1.0b1

* Thu Aug 25 2022 Brandon Nielsen <nielsenb@jetfuse.net> 0-1.20220825git32483ad
- Update to 32483ad git snapshot

* Sun Feb 27 2022 Brandon Nielsen <nielsenb@jetfuse.net> 0-1.20220227gitfe6c189
- Update to fe6c189 git snapshot

* Tue Nov 16 2021 Brandon Nielsen <nielsenb@jetfuse.net> 0-1.20211116git95113dc
- Update to latest git

* Wed Sep 22 2021 Brandon Nielsen <nielsenb@jetfuse.net> 0-1.20210916git59864c0
- Initial specfile
