#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h>

int main(int argc, char *argv[]) {

	if (argc != 2) {// We want only 2 arguments
		perror("./a.out [HOSTNAME/IPADDRESS] [PORT]");
		exit(-1);
	}

	char *hostName = argv[1];		// Get HostName or IPv4/v6 Address
	// char *portName = argv[2];		// Get PortName or Port Number
	struct addrinfo hints;			// Give initial hints to resolver
	struct addrinfo *result, *rp;		// Result will be stored here

	// Prepare the hints for resolver
	memset(&hints, 0, sizeof(struct addrinfo));
	hints.ai_family = AF_UNSPEC;		// IPv4 or v6
	hints.ai_socktype = SOCK_STREAM;	// Hardcoded TCP as dummy
	hints.ai_protocol = IPPROTO_TCP;	// Hardcoded TCP as dummy
	hints.ai_flags = AI_CANONNAME;		// I want canonical name!!

	// Only stream sockets
	// Only TCP protocol
	// Get address(es) associated with the specified name/service
	// Modify servAddr contents to reference linked list of addresses
	int s = getaddrinfo(hostName, NULL, &hints, &result);
	if (s != 0) {
		perror("getaddrinfo() failed");
		exit(s);
	}

	// Display returned addresses3.1 Mapping Names to Numbers
	// We don't use portName because no need of resolving service
	for (rp = result; rp != NULL; rp = rp->ai_next) {
		printf("result->ai_flags = %d\n", rp->ai_flags);
		printf("result->ai_family = %d\n", rp->ai_family);
		printf("result->ai_socktype = %d\n", rp->ai_socktype);
		printf("result->ai_protocol = %d\n", rp->ai_protocol);
		printf("result->ai_addrlen = %zd\n", rp->ai_addrlen);
							// z for integer conversion corresoponds to 
							// a size_t or ssize_t argument
		printf("result->ai_canonname = %s\n", rp->ai_canonname);

		// struct sockaddr *address;
		struct sockaddr_in *saIn4;
		struct sockaddr_in6 *saIn6;
		char addrString[INET6_ADDRSTRLEN];
		memset(addrString, 0, sizeof(addrString));

		switch (rp->ai_family) {
		case AF_INET:
			saIn4 = (struct sockaddr_in *) rp->ai_addr;
			inet_ntop(rp->ai_family, &saIn4->sin_addr.s_addr, addrString, sizeof(addrString));
			break;

		case AF_INET6:
			saIn6 = (struct sockaddr_in6 *) rp->ai_addr;
			inet_ntop(rp->ai_family, &saIn6->sin6_addr.s6_addr, addrString, sizeof(addrString));
			break;

		default:
			printf("unknown protocol\n");
			break;
		}

		printf("IP Address: %s\n", addrString);
		
	}
	freeaddrinfo(result); // Free addrinfo allocated in getaddrinfo()

	exit(0);
}
