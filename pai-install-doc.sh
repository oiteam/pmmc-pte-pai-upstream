#!/bin/sh

. linux/share/functions

case "`lsb_release -sc`" in
    "hardy")
        MKTEMP_OPTS="-t"
    ;;

    *)
        MKTEMP_OPTS="--tmpdir"
    ;;
esac

download_dir=${download_dir:-`mktemp -d ${MKTEMP_OPTS} pai-download-XXXXXX`}
unpack_dir=${unpack_dir:-`mktemp -d ${MKTEMP_OPTS} pai-unpack-XXXXXX`}
orig_dir=${unpack_dir}/usr/share/PTE-PMMC/pai/documentos
dest_dir=${1}

pai_download ${download_dir}
pai_unpack ${download_dir} ${unpack_dir}
pai_install_doc ${orig_dir} ${dest_dir}
rm -rf ${download_dir} ${unpack_dir}
