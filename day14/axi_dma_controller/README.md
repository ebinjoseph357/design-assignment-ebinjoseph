 AXI DMA Controller Verification Environment

## Overview

This repository contains the SystemVerilog verification components developed for the verification of an AXI DMA Controller. The verification environment was designed to validate both **Normal DMA** and **Scatter-Gather DMA** transfer operations by generating transactions, monitoring AXI activity, and collecting verification statistics.



## Verification Components

### 1. Test

The Test module acts as the top-level controller of the verification environment.

#### Responsibilities

* Creates and initializes the verification environment.
* Configures DMA test scenarios.
* Supports Normal DMA and Scatter-Gather DMA test execution.
* Controls transaction generation parameters.
* Waits for simulation completion.
* Collects and displays final verification results.

#### Test Cases Implemented

* **16-bit Normal DMA Transfer**
* **Scatter-Gather DMA Transfer**

---

### 2. Environment

The Environment serves as the central verification framework.

#### Responsibilities

* Instantiates the Agent and Scoreboard.
* Creates mailbox-based communication channels.
* Connects verification components through a shared interface.
* Executes Agent and Scoreboard processes concurrently.

#### Communication Flow

```text
Monitor
   ↓
Mailbox (mon2scb)
   ↓
Scoreboard
```

---

### 3. Monitor

The Monitor is a passive verification component that observes DUT activity.

#### Responsibilities

* Monitors AXI write channel transactions.
* Detects successful AXI write handshakes.
* Observes:

  * M_AWVALID
  * M_AWREADY
  * M_WVALID
  * M_WREADY
* Sends transaction notifications to the Scoreboard through a mailbox.

#### Handshake Detection

```text
M_AWVALID = 1
M_AWREADY = 1
M_WVALID  = 1
M_WREADY  = 1
```

When all conditions are satisfied, a valid AXI write transaction is recorded.

---

### 4. Scoreboard

The Scoreboard is responsible for verification result collection and reporting.

#### Responsibilities

* Receives transaction notifications from the Monitor.
* Counts valid AXI memory write operations.
* Maintains verification statistics.
* Generates a final summary report at the end of simulation.

#### Example Output

```text
-------------------------------------------------
[SCOREBOARD] Total Valid AXI Writes to Memory: 5
-------------------------------------------------
```

---

## Verification Flow

```text
Test
 ↓
Environment
 ↓
Agent
 ↓
Driver
 ↓
AXI DMA Controller
 ↓
Monitor
 ↓
Mailbox
 ↓
Scoreboard
 ↓
Verification Statistics
```

---

## Key Features

* SystemVerilog Class-Based Verification
* Mailbox-Based Component Communication
* Support for Normal DMA Verification
* Support for Scatter-Gather DMA Verification
* AXI Write Transaction Monitoring
* Automated Statistics Collection and Reporting

---

## Author Contribution

Developed the **Test**, **Environment**, **Monitor**, and **Scoreboard** modules for the AXI DMA Controller verification environment. Implemented transaction monitoring, mailbox-based communication, test execution control, and verification statistics reporting to validate DMA controller functionality.
