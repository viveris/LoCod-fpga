# master_memory_ctrl : Memory interface converter to AXI4 Lite master

## Description

This component acts as a bridge between the generic memory interface present at the output of Bambu-generated components, and an AXI4 Lite interface. It converts all the transactions incomming on the generic interface and generate AXI4 Lite transactions on a AXI4 lite master output port.