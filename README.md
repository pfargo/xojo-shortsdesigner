# Shorts Designer

Shorts Designer is a tool I developed for my personal use. I am open sourcing the code as a thank you to the RB, RS, Xojo community which I have enjoyed being a member of for the last 15 years. The Designer component requires BKeeney Software's Shorts reporting tool. This is a commercial product which I chose to use due to it's flexibility and support. Designer is intended to be a simple banded reporting tool. It is not a universal, do everything under the sun reporting tool. Shorts, on the other hand, can do just about anything if you take the time to learn it's usage. I felt the ease of a GUI for simple reporting coupled with the power of being able to manually create, through code, any difficult reports was a natural fit.

## What it is

* Simple Banded Report Designer
* Header, Grand Summary leading, multiple breaks leading, body, multiple breaks trailing, grand summary trailing and footer bands.
* Connects to SQLite, CubeSQL, ODBC, PostgreSQL and MySQL (at this time)
* Band level conditional formatting using XojoScript and contextual commands
* Temporary views (temp tables for MySQL) can be created and saved as part of the report 
* Saved report files are simple JSON which can be used with BKeeney Shorts or your own system
* If foreign keys are used all relationship paths are built automatically. If not you can add them and they will be saved within the report file.
* SQL generated automatically and queries use prepared statements.

## What it is not

* An advanced designer
* Supported - Although development is ongoing and I am very interested in all feedback there is no official support implied. BKeeney software is planning on releasing a supported version of the code for users of BKeeney Shorts.

## Acknowledgments...

* Bob Keeney for Shorts which inspired this project
* Oliver Osswald for his imSplitter control
* All the snippets, used throughout, from the RB/RS/Xojo forums

## Notes:

* Untested in Linux