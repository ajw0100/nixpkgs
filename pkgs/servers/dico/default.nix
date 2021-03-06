{ fetchurl, stdenv, libtool, gettext, zlib, readline, gsasl
, guile, python, pcre, libffi, groff }:

stdenv.mkDerivation rec {
  pname = "dico";
  version = "2.10";

  src = fetchurl {
    url = "mirror://gnu/${pname}/${pname}-${version}.tar.xz";
    sha256 = "0qag47mzs00d53hnrmh381r0jay42766vp5xrffmzmsn2307x8vl";
  };

  hardeningDisable = [ "format" ];

  buildInputs =
    [ libtool gettext zlib readline gsasl guile python pcre libffi groff ];

  doCheck = true;

  meta = with stdenv.lib; {
    description = "Flexible dictionary server and client implementing RFC 2229";
    homepage    = "https://www.gnu.org/software/dico/";
    license     = licenses.gpl3Plus;
    maintainers = with maintainers; [ lovek323 ];
    platforms   = platforms.linux;

    longDescription = ''
      GNU Dico is a flexible modular implementation of DICT server
      (RFC 2229).  In contrast to another existing servers, it does
      not depend on particular database format, instead it handles
      database accesses using loadable modules.

      The package includes several loadable modules for interfacing
      with various database formats, among them a module for dict.org
      databases and a module for transparently accessing Wikipedia or
      Wiktionary sites as a dictionary database.

      New modules can easily be written in C, Guile or Python.  The
      module API is mature and well documented.

      A web interface serving several databases is available.

      The package also includes a console client program for querying
      remote dictionary servers.
    '';
  };
}
