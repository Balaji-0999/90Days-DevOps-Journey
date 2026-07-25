# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Objective

Today I learned the core networking concepts that every DevOps Engineer should know. I understood how domain names are resolved into IP addresses, how IP addressing works, why subnetting is used, and how ports allow multiple services to run on a single server.

---

# Task 1 – DNS (How Names Become IPs)

## What happens when I type google.com in a browser?

1. The browser sends a DNS query asking for Google's IP address.
2. The DNS server responds with Google's IP address.
3. The browser establishes a TCP connection with Google's server.
4. The server processes the request and sends the webpage back to my browser.

---

## DNS Record Types

### A Record
Maps a domain name to an IPv4 address.

### AAAA Record
Maps a domain name to an IPv6 address.

### CNAME Record
Creates an alias for another domain name.

### MX Record
Specifies the mail server responsible for receiving emails.

### NS Record
Specifies the authoritative name servers for a domain.

---

## Command Used

```bash
dig google.com
```

### Observation

- Found the A Record (IPv4 address).
- Observed the TTL value, which tells how long the DNS response can be cached.

---

# Task 2 – IP Addressing

## What is an IPv4 Address?

An IPv4 address is a unique 32-bit address assigned to every device on a network.

Example:

```
192.168.1.10
```

----

## Public IP vs Private IP

### Public IP

Accessible from the Internet.

Example:

```
34.125.90.10
```

### Private IP

Used inside private networks and cannot be accessed directly from the Internet.

Example:

```
172.31.17.152
```

---

## Private IP Ranges

```
10.0.0.0/8

172.16.0.0 – 172.31.255.255

192.168.0.0/16
```

---

## Command Used

```bash
ip addr show
```

### Observation

My EC2 instance is using a private IP address.

---

# Task 3 – CIDR & Subnetting

## What does /24 mean?

It means the first 24 bits identify the network, while the remaining 8 bits are available for host addresses.

---

## Why Do We Use Subnetting?

Subnetting divides a large network into smaller networks.

Benefits:

- Better security
- Better performance
- Easier management
- Reduced broadcast traffic

---

## CIDR Table

| CIDR | Subnet Mask | Total IPs | Usable Hosts |
|------|-------------|----------:|-------------:|
| /24 | 255.255.255.0 | 256 | 254 |
| /16 | 255.255.0.0 | 65,536 | 65,534 |
| /28 | 255.255.255.240 | 16 | 14 |

---

# Task 4 – Ports

## What is a Port?

A port is a communication endpoint used by applications.

A single server can run many services because each service listens on a different port.

---

## Common Ports

| Port | Service |
|------|----------|
| 22 | SSH |
| 53 | DNS |
| 80 | HTTP |
| 443 | HTTPS |
| 3306 | MySQL |
| 6379 | Redis |
| 27017 | MongoDB |

---

## Command Used

```bash
ss -tulpn
```

### Observation

I observed the services listening on different ports such as SSH (22) and other running services.

---

# Task 5 – Putting It Together

## What happens when I run

```bash
curl http://myapp.com:8080
```

- DNS resolves the domain into an IP address.
- TCP creates a connection.
- The request is sent to port 8080.
- The application receives the request.
- The server sends the response back.

---

## My application cannot connect to the database at 10.0.1.50:3306.

First, I would check:

- Is the database server reachable?
- Is port 3306 open?
- Is MySQL running?
- Is the firewall blocking traffic?
- Is DNS resolving correctly (if using a hostname)?

---

# Commands Used

```bash
hostname -I
ip addr show
dig google.com
nslookup google.com
ss -tulpn
curl -I https://google.com
```

---

# What I Learned

- DNS converts domain names into IP addresses.
- Public and private IP addresses have different purposes.
- CIDR and subnetting help organize networks efficiently.
- Ports allow multiple services to run on the same server.
- Networking concepts are essential for troubleshooting production systems.

---

# Why This Matters for DevOps

In production, almost every application depends on networking.

Understanding DNS, IP addresses, subnets, and ports helps troubleshoot issues such as:

- Website not loading
- DNS resolution failures
- Application connectivity problems
- Database connection failures
- Incorrect firewall or security group rules
- Services listening on the wrong ports

A strong networking foundation enables faster troubleshooting and more reliable system managementi.
