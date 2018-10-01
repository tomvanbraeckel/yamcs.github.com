---
layout: default
permalink: /docs/studio/Preference_Defaults/
sidebar: yes
---

Most user preferences are linked to the workspace and saved to a folder <tt>.metadata</tt>. Whenever a user creates a new workspace, the workspace starts with the default preferences.

These default preferences can be modified by adding or modifiying the <tt>Yamcs Studio.ini</tt> file in the installation directory of Yamcs Studio. This is often done to ensure that different workstations use similar site-specific configuration.

Some of the more common preferences are documented below.

<dl>
    <dt><tt>org.csstudio.opibuilder/colors.list</tt></dt>
    <dd>
        List of named colors. Entries are separated by semicolons. Each entry is composed as <tt>NAME@R,G,B</tt>. For example: <tt>Major@255,0,0;Minor@255,128,0</tt>. You can choose any name, but note that the names <tt>Major</tt>, <tt>Minor</tt>, <tt>Invalid</tt> and <tt>Disconnected</tt> have a special meaning in Yamcs Studio. They are used for common decorations such as out-of-limit indicators.
    </dd>
    <dt><tt>org.csstudio.opibuilder/fonts.list</tt></dt>
    <dd>
        List of named fonts. Entries are separated by semicolons. Each entry is composed as <tt>NAME@FONT-STYLE-SIZE</tt>. For example: <tt>Header 1@Arial-bold-19;Header 2@Arial-bold-15</tt>. The font should be availabe on the system. Only 'Liberation Sans' (which is the default) is dynamically loaded when it is missing from the system, this is to ensure that the default font settings produce identical displays on all platforms. Note that font size is expressed in points, not pixels.
    </dd>
    <dt><tt>org.csstudio.opibuilder/hidden_widgets</tt></dt>
    <dd>
        Hide the specified widgets from the palette. Widgets are mentioned by their id. and separated by the vertical bar character.
    </dd>
    <dt><tt>org.csstudio.opibuilder/schema_opi</tt></dt>
    <dd>
        Workspace reference to the active Schema OPI. For example: <tt>/My Project/schema.opi</tt>
    </dd>
    <dt>
        <tt>org.yamcs.studio.core.ui/singleConnectionMode</tt>
        <tt>org.yamcs.studio.core.ui/connectionString</tt>
    </dt>
    <dd>
        When <tt>singleConnectionMode</tt> is set to <tt>true</tt>, Yamcs Studio will not open the Connection Manager window, but will only allow connections to a single Yamcs server defined in the <tt>connectionString</tt>
    </dd>
</dl>
