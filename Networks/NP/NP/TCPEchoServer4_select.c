#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

#define BUFSIZE 1024

static const int MAXPENDING = 5; // Maximum outstanding connection requests

int AcceptTCPConnection(int servSock) {
	struct sockaddr_in clntAddr;
	socklen_t clntAddrLen = sizeof(clntAddr);

	// Wait for a client to connect
	int clntSock = 
			accept(servSock, (struct sockaddr *) &clntAddr, &clntAddrLen);
	if (clntSock < 0) {
		perror("accept() failed");
		exit(-1);
	}

	char clntIpAddr[INET_ADDRSTRLEN];
	if (inet_ntop(AF_INET, &clntAddr.sin_addr.s_addr, 
			clntIpAddr, sizeof(clntIpAddr)) != NULL) {
		printf("----\nHandling client %s %d\n", 
				clntIpAddr, ntohs(clntAddr.sin_port));
	} else {
		puts("----\nUnable to get client IP Address");
	}

	return(clntSock);
}


ssize_t EchoMessage(int clntSock) {
	// Receive data
	char buffer[BUFSIZE];
	memset(buffer, 0, BUFSIZE);
	ssize_t recvLen = recv(clntSock, buffer, BUFSIZE, 0);
	if (recvLen < 0) {
		perror("recv() failed");
		exit(-1);
	}
	buffer[recvLen] = '\n';
	fputs(buffer, stdout);

	// while (recvLen > 0) {
	//	printf("Begining of Client Loop\n");
		// Send the received data back to client
		ssize_t sentLen = send(clntSock, buffer, recvLen, 0);
		if (sentLen < 0) {
			perror("send() failed");
			exit(-1);
		} else if (sentLen != recvLen) {
			perror("send() sent unexpected number of bytes");
			exit(-1);
		}

		// See if there is more data to receive
		// memset(buffer, 0, BUFSIZE);
		// recvLen = recv(clntSock, buffer, BUFSIZE, 0);
		// if (recvLen < 0) {
			// perror("recv() failed");
			// exit(-1);
		// } else if (recvLen > 0) { // some data was remaining
			// buffer[recvLen] = '\n';
			// fputs(buffer, stdout);
		// }
		// printf("End of Client Loop\n");
	// }

	return(recvLen);
}

int main(int argc, char ** argv) {

	if (argc != 2) {
		perror("<server port>");
		exit(-1);
	}

	in_port_t servPort = atoi(argv[1]); // Local port

	// create socket for incoming connections
	int servSock;
	if ((servSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		perror("socket() failed");
		exit(-1);
	}

	// Set local parameters
	struct sockaddr_in servAddr;
	memset(&servAddr, 0, sizeof(servAddr));
	servAddr.sin_family = AF_INET;
	servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servAddr.sin_port = htons(servPort);

	// Bind to the local address
	if (bind(servSock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0) {
		perror("bind() failed");
		exit(-1);
	}

	// Listen to the client
	if (listen(servSock, MAXPENDING) < 0) {
		perror("listen() failed");
		exit(-1);
	}

	// Prepare for using select()
	fd_set orgSockSet; // Set of socket descriptors for select
	FD_ZERO(&orgSockSet);
	FD_SET(STDIN_FILENO, &orgSockSet); // STDIN
	FD_SET(servSock, &orgSockSet);
	int maxDescriptor;
	if (STDIN_FILENO > servSock) {	
		maxDescriptor = STDIN_FILENO;
	} else {
		maxDescriptor = servSock;
	}
	// Setting select timeout as Zero makes select non-blocking
	struct timeval timeOut;
	timeOut.tv_sec = 0; // 0 sec
	timeOut.tv_usec = 0; // 0 microsec

	// Server Loop
	int loopRunning = 1;
	while (loopRunning) {
		// The following process has to be done every time
		// because select() overwrite fd_set.
		fd_set currSockSet;
		memcpy(&currSockSet, &orgSockSet, sizeof(fd_set));

		select(maxDescriptor + 1, &currSockSet, NULL, NULL, &timeOut);

		int currSock;
		for (currSock = 0; currSock < maxDescriptor + 1; currSock++) {
			// printf("Checking socket(%d)\n", currSock);
			if (FD_ISSET(currSock, &currSockSet)) {

				// A new client
				// Establish TCP connection,
				// register a new socket to fd_sed to watch with select(),
				// and echo first message
				if (currSock  == servSock) {
					int newClntSock;
					newClntSock = AcceptTCPConnection(servSock);
					FD_SET(newClntSock, &orgSockSet);
					if (maxDescriptor < newClntSock) {
						maxDescriptor = newClntSock;
					}
					// EchoMessage(newClntSock);
				}

				// An input from Keybord  
				else if (currSock == STDIN_FILENO) {
					printf("Shutting down server\n");
					getchar();
					loopRunning = 0;
				}

				// Input from an existing client
				// Echo the message
				else {
					// printf("Checking socket(%d)\n", currSock);
					ssize_t recvLen = EchoMessage(currSock);
					if (recvLen == 0) {
						FD_CLR(currSock, &orgSockSet);
					}
				}
			}
		}
	}


	int closingSock;
	for (closingSock = 0; closingSock < maxDescriptor + 1; closingSock++) {
		close(closingSock);
	}
	printf("End of Program\n");

}
