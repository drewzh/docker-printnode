
# Installation

Make sure to create a named volume to store your CUPS configuration. Pre-defining an empty named volume with for e.g `docker create volume printnode` will allow /etc/cups directory to be copied over into the new volume. Failure to provide a working CUPS configuration directory will result in a broken container.

```bash
docker run \
-e PRINT_CLIENT_EMAIL='a@b.c' \
-e PRINT_CLIENT_PASSWORD='123abc' \
-e CUPS_USER='admin' \
-e CUPS_PASSWORD='123abc' \
--network='host' \
--volume printnode:/etc/cups \
drewzh/printnode
```

# Environment Variables

- CUPS_USER - The username to secure CUPS
- CUPS_PASSWORD - The password to secure CUPS
- PRINT_CLIENT_EMAIL - Email you use to login to PrintNode
- PRINT_CLIENT_PASSWORD - Password you use to login to PrintNode

# Adding Printers (IPP)

To add printers, you can use IPP (which negates the need for drivers) by attaching to the running container and running something like the following:

```bash
lpadmin -p LabelPrinter -E -v ipp://192.168.86.44/ipp -m everywhere
lpadmin -p LaserPrinter -E -v ipp://192.168.86.54/ipp -m everywhere
```
