---
title: "Project"
---

Our project is going to be a social media platform. 
- Users should be able to create accounts,
- follow others,
- like posts,
- post comments, 
- repost
- direct message
- friend people

First deliverable due **Friday**: Software Requirements Specification
- Due: By end of next-next week.
- Description of company, staff, skills
- Introduction.
- Description of product in broad terms.
- Requirements (specific list of things that must be satisfied by the project)
	* Two Categories:
		1. Functional Requirements
			- Indicate functionality and actions the producg must perform or possess.
			- e.g., the user should be able to make posts with a character limit of $n$.
		2. Non-Functional Requirements
			- e.g., aesthetics, arrangements of elements

**Web Services**:

There are two main areas:
1. The User
2. The Server
	1. Middleware
	2. Backend

**Decisions**:
1. What server? (AWS, Azure, Google Cloud, etc.)
2. What middleware?
	- e.g., Jango (Python, which likes MySql), Express (JavaSript, which likes non-What SQL), Rails (Ruby, which like SQL)
3. What frontend?

He will ask:
- What technologies we are using
- Due by Next Friday:
	* I: Web Server
		1. Set up a cloud server and install the database
		2. Create a table
		3. Populate the table with dummy data
		4. Create a static webpage with a button
		5. When the button is pushed, display the contents of the table.
	* II: SRS Outline
		1.  Description of Project
		2.  Introduction of Client
		3.  Introduction of Company
		4.  Requirements:
			- Functional Requirements
			- Non-Functional Requirements
		5.  Agreement Page.
	* III: Company Web Page
		+ Make it look professional
		+ This is separate from the web service
		+ Should have "Projects" section that lists all projects you are currently working on.
			+ Should have a link to project's Git repo 
			+ SRS will be stored here, meeting logs, etc.

> -# **Deliverable: Company Web Page**
> -# * Make it look professional
> -# * This is separate from the web service
> -# * Should have "Projects" section that lists all projects you are currently working on.
> -# 	* Should have a link to project's Git repo 
> -# 	* SRS will be stored here, meeting logs, etc.

**State Explosion Problem**: This is why we want to break things down.
- We want to reason about things separately.

"Out of their minds"

There is always one more bug.

**Software Engineering**: The application of a **systematic**, **quantifiable**, and **disciplined** approach to the development, operation, and maintenance of software.

- Quantifiable: Measurable.
- Disciplined: Guidelines & conventions.

Software Development Life Cycle:
1. Requirements Engineering
2. Design
3. Implementation (Writing Code)
4. Verification (Testing)
5. Maintenance.

**Waterfall Model:**
- You go through each step of the SDLC linearly and strictly, you can't go back.
- Used for strict, mission-critical applications
- Too inflexible for most real-world software development

**Incremental Model:**
- You can go back phases when necessary.
	* No real cycle.
- You aim to create a small working version of the project as early as possible.
	* Each iteration is functional

**Evolutionary Models**
- You go through the full SDLC over-and-over.
- You can't go back, but you can tweak things on the next spiral.

**Formal Methods**
- Using mathematical techniques to derive mathematical guarantees of correctness or at least high-levels of assurance, usually with automated tools.
- Apple mostly in *design* and *verification* stages.

Some problems are unsolvable, like verifying if an algorithm halts.


