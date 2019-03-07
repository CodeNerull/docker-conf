#!/bin/bash
#各扩示版本，未定义时不安装
GRPC_VERSION=1.14.1 #grpc
MONGODB_VERSION=1.5.2 #mongodb
REDIS_VERSION=4.0.2 #redis
SWOOLE_VERSION=2.2.0 #swoole
XDEBUG_VERSION=2.5.5 #xdebug

EXT_LIST=('GRPC' 'INTL' "REDIS" 'SWOOLE' 'XDEBUG')

EXT_FOLDER=./ext

if [ ! -d ${EXT_FOLDER} ]; then
    mkdir ${EXT_FOLDER}
    echo "${EXT_FOLDER} 文件夹创建成功。"
else
    echo "${EXT_FOLDER} 文件夹已存在。"
fi

function DEF_VARIABLE(){
    if [ "x${1}" != "x" ]; then
        return 1
    else  
        return 0
    fi
}

function EXISTS_FILE(){
    if [ -e ${1} ]; then
        return 1
    else  
        return 0
    fi
}


EXT_LIST_LEN=${#EXT_LIST[@]} 
for ITEM_EXT in ${EXT_LIST[@]};
do
    ITEM_EXT_LOWER=`echo ${ITEM_EXT} | tr "[A-Z]" "[a-z]"`
    ITEM_EXT_VERSION_NAME_RES="${ITEM_EXT}_VERSION"
    ITEM_EXT_VERSION_NAME=`eval echo '$'"${ITEM_EXT_VERSION_NAME_RES}"`
    DEF_VARIABLE ${ITEM_EXT_VERSION_NAME}
    if [ ${?} == 1 ];
    then
        ITEM_FILE_NAME="${EXT_FOLDER}/${ITEM_EXT_LOWER}-${ITEM_EXT_VERSION_NAME}.tgz"
        EXISTS_FILE ${ITEM_FILE_NAME}
        if [ ${?} == 1 ];
        then
            echo "${ITEM_FILE_NAME}文件已存在。"
        else
            echo "正在下载 ${ITEM_FILE_NAME} ..."
            wget "https://pecl.php.net/get/grpc-${GRPC_VERSION}.tgz" -O ${ITEM_FILE_NAME}
        fi
    fi
done

echo "下载完成！\n"

