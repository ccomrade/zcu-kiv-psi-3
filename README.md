# zcu-kiv-psi-3

This is the third KIV/PSI project. A simple REST client that uses public web APIs to obtain the current location of the
[ISS](https://en.wikipedia.org/wiki/International_Space_Station).

## Implementation

The client is implemented as a shell script.
It should work on any POSIX-compatible system with a shell interpreter and the following additional utilities:
- `httpie`
- `jq`

## Usage

To see where the ISS currently is, simply run the script:

```
./iss_now.sh
```

Here is an example output:

```
The ISS is currently on the illuminated side of the Earth
Observation conditions are not ideal
```
