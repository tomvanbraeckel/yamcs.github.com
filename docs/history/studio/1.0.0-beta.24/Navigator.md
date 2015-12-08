---
layout: default
sidebar: yes
version: 1.0.0-beta.24
permalink: /docs/studio/1.0.0-beta.24/Navigator/
---

The Navigator tab shows a folder-like structure of the resources contained within our current workspace.

![Navigator](/assets/studio/navigator.png){: .center-image }

### Projects
Recall that within Yamcs Studio, you are always working in one workspace only. Within that workspace you create or import *projects*. It is the projects that contain the actual resources (files and/or directories).

#### Creating a Project
To create a new project, choose **File > New Project**, or right-click in the navigator and choose **New Project** from the pop-up menu.

#### Importing Existing Projects
To import an existing project, select **File > Import** and choose **Existing Projects into Workspace**. Navigate to the project's folder, and if Yamcs Studio recognizes it as a project you will be able to import it.

<div class="hint">
    Projects are just directories on your disk (usually under version control). Yamcs Studio recognizes existing projects by the metadata which is added under the hidden <tt>.metadata</tt> folder. This metadata includes project-specific preferences, as well as for example the name of the project.
</div>

### Resources
Any file can be added to a project or a contained directory. To do so right-click on the desired node to open the popup menu, and choose your desired file type under the **New** item.

To add an existing file to a project (for example a project). Copy it to your clipboard, and paste it onto the node. Alternatively, use the **File > Import > General > File System** option.

Open a file by double-clicking on it. If you open a file, yet Yamcs Studio does not have a specific handler for the type of file, it will open it with your system default program for that extension.

The default Yamcs Studio distribution handles <tt>*.def</tt> and <tt>*.opi</tt> files. It also comes with a built-in text editor for basic editing of many other types of files as well (including <tt>*.txt</tt>, <tt>*.js</tt> and <tt>*.py</tt>).

Use right-click **Open With** for more control over how the file is to be opened.

#### Searching
An advanced search and replace dialog is available from the **Search** menu. If you select a node in the navigator before opening the Search dialog, this dialog will be configured to only search resources under that node.

![Search](/assets/studio/search.png){: .center-image }

Your search can include wildcard characters, and can be further specified to only a specific set of resources. The results will be opened in a **Search** view which also allows for replacing occurrences upon right-click.

![Search Results](/assets/studio/search-results.png){: .center-image }
