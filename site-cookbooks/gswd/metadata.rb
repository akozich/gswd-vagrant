name              "gswd"
maintainer        "Noah Kantrowitz"
maintainer_email  "noah@coderanger.net"
license           "Apache 2.0"
description       "Customizations for the GSWD development VM"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"

depends           "postgresql"
depends           "database"

recipe            "gswd", "Installs virtualenv for project."
recipe            "gswd::database", "Installs database for project."
