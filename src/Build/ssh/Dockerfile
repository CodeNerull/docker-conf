# 选择一个已有的os镜像作为基础
FROM centos:7

# 镜像的作者
MAINTAINER fanchen "461670311@qq.com"

# openssh-server
RUN yum install -y openssh-server && \
	yum clean all && \
	#UsePAM yes 改为 UsePAM no
	sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && \
	#UsePrivilegeSeparation sandbox 改为 UsePrivilegeSeparation no
	sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
	# 修改root密码
	echo "root:123456" | chpasswd && \
	# 下面这几句比较特殊，在centos上必须要有，否则创建出来的容器sshd不能登录
	ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' && \
	ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
	ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''

# 启动sshd服务并且暴露22端口
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]