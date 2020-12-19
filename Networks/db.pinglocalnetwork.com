;
; BIND data file for pinglocalnetwork.com;
$TTL	604800
@	IN	SOA	pinglocalnetwork.com. root.pinglocalnetwork.com. (
			      5		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.pinglocalnetwork.com.
@	IN	A	10.0.0.253
@	IN	AAAA	::1
ns	IN	A	10.0.0.253 

