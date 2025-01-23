---
title: "Foundation for Systems Design"
---

# What is Systems Design

$$
\text{Analysis (Analysis Models and Documents)}
\to
\text{Design (Design Models and Documents)}
\to
\text{Implementation}
$$

- **Analysis**: What is required
	* Starting point for design
- **Design**: How the system will be configured and constructed.
	* Starting point for implementation
	* **Objective**: Define, Organize, and Structure the components of the solution to serve as a blueprint for construction.

# Design Models

Design is a model-building activity.
- A project's formality dictates the type, complexity, and depth of models. 
	* (e.g., AGILE/Iterative projects typically build fewer models.)

> **Remember**: Jumping to programming without design often causes less than optimum solution and may require rework.

# Analysis Models $\to$ Design Models

Requirements Models:
- Domain Model Class Diagram
- Use Case Diagrams
- Activity Diagrams and Use Case Description
- System Sequence Diagrams
- Requirements State Machine Diagrams

Design Models:
- Component Diagrams
- Deployment Diagrams
- Design Class Diagrams
- Interaction Diagrams (Sequence Diagrams)
- Design State Machine Diagrams
- Package Diagrams

# Design Activities

Design Activities:
- Describe the environment (all the tech required to support the software application)
	* *How will this system interact with other systems and existing tech?*
- Design...:
	* Application Components (well-defined units of software the perform function(s))
		+ *What are key parts of the information system, and how will they interact when the system is deployed?*
	* User Interface (to the user, the UI is the system)
		+ *How will users interact with the information system?*
	* Database
		+ *How will data be captured, structured, and stored for later use by the information system?*
	* Software Classes and Methods (aka: detailed design)
		+ *What internal structure for each application component will ensure efficient construction, rapid deployment, and reliable operation?*
		+ (e.g., Design Class Diagram, Sequence Diagrams, State-Machine Diagrams)

> **More on Application Components: Issues packaging components**
> - Scope and size: What are the functions, boundaries, and interfaces?
> - Programming Language: What are the accepted languages?
> - Build of Buy: Is an acceptable version available to purchase?

> **More on Application Components: Typical models for designing application components**
> - Package Diagram
> - Component Diagram
> - Deployment Diagram

> **More on UI: Typical models for designing UI**
> - Storyboard
> - System sequence diagram
> - Small screen menu prototype

> **More on Database: Relational Database Management Systems (RDBMS)**
> - Current tech frequently uses RDBMS.
> - *Requires converting the data model to a relational database.*
> 	* Must address:
> 		1. Throughput and response time
> 		2. Security.

> **More on Database: Example — Typical Table Definition as Part of Database Scheme**
> 
> | Field            | Type         | Collation         | Attributed | Null | Default | Extra |
> |------------------|--------------|-------------------|------------|------|---------|-------|
> | productItem      | varchar(15)  | latin1_swedith_ci |            | No   | None    |       |
> | inventoryItem    | mediumint(9) |                   |            | No   | None    |       |
> | size             | varchar(8)   | latin1_swedith_ci |            | No   | None    |       |
> | color            | varchar(10)  | latin1_swedith_ci |            | No   | None    |       |
> | options          | varchar(12)  | latin1_swedith_ci |            | No   | None    |       |
> | quantityOnHand   | mediumint(9) |                   |            | No   | None    |       |
> | averageCost      | decimal(8,2) |                   |            | No   | None    |       |
> | reorderQuantity  | mediumint(9) |                   |            | No   | None    |       |
> | dateLastOrder    | date         |                   |            | No   | None    |       |
> | dateLastShipment | date         |                   |            | No   | None    |       |

<!--
More on Software Classes and Methods: Typical Design Class Diagram with Attributes and Methods:
-->

# System Controls and Security

**Integrity Controls**: Maintain integrity inf inputs, outputs, and data and programs.
- Integrated into application programs and DBMS
- Objectives:
	* Ensure only appropriate and correct business transactions are accepted.
	* Ensure transactions and recorded and processed correctly.
	* Protect and safeguard assets like the database.

**Security Controls**: Protect the assets form threats, internal and external.

## Input Controls

Prevent invalid or erroneous data from entering the system.

**Value Limit Controls**: Check the range of inputs for reasonableness

**Completeness Controls**: Ensure all the data has been entered

**Data Validation Controls**: Ensure that specific data values are correct

**Field Combination Controls**: Ensure data is correct based on relationships between fields.

## Output Controls

Important for ensuring that output arrives at proper destination and is accurate, current, and complete.

> Examples:
> - Physical access to printers and display devices.
> - Protection from "dumpsite diving" discarded data
> - Labels on printed and electronic output to identity source of data.

## Redundancy, Backup, and Recovery

Goal: Protect data and systems from catastrophes.
- e.g., databases, hardware, software applications, networks.

## Designing Security Controls

Goal: Protect all assets against external threats.
- Protect and maintain a stable, functioning operating environment 24/7
- Protect information and transactions during transmission across networks and Internet.

### Types of Users

**Access Controls**: Limit a person's ability to access servers, files, data, and applications.

**Registered Users**: Those with authorization.

**Unauthorized Users**: Anyone not registered

**Privileged Users**: Those that maintain lists and systems.

## Data Encryption

**Encryption**: Alter data to make it unrecognizable.

**Decryption**: Convert encrypted data back to readable format.

**Encryption Algorithm**: Mathematical transformation of the data.

**Encryption Key**: Lone data string that allows the same algorithm to produce unique encryptions.

### Symmetric v.s. Asymmetric Key Encryption

**Symmetric**: Uses same key to encrypt and decrypt 

**Asymmetric**: Uses different keys to encrypt and decrypt.

## Secure Transactions

**Secure Sockets Layer (SSL)**: Standard set of protocols for authentication and authorization

**Transport Layer Security (TLS)**:  Internet standard equivalent to SSL.

**IP Security (IPSec)**: Internet security protocol at a low-level transmission.

**Hypertext Transfer Protocol Secure (HTTPS)**: Internet standard to transmit Web pages.


