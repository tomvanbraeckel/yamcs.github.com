---
layout: default
sidebar: yes
permalink: /docs/studio/Command_Stack/
---

The Command Stack allows operators to prepare stacks of commands for manual command issuing. The process is intentionally click-heavy to make sure that operators are aware of what they are doing.

When you issue commands from Yamcs Studio, these are queued to Yamcs Server, which will perform any further steps.

We're keen on bringing many improvements to this view for better editing, but it is usable in its current state.

* TOC
{:toc}

### Preparing a Stack
You can prepare a stack of commands only when you are connected to Yamcs. Yamcs Studio uses this connection to retrieve the list of available commands or to perform server-side validations.

When you start Yamcs Studio, the Command Stack view (available from the OPI Runtime perspective) is by default shown below the operator displays. If you can't find it back, select **Window > Show View > Command Stack**.

![Command Stack](/assets/studio/stack-new.png){: .center-image }

Add a command by clicking the ![New Command](/assets/studio/icons/new_command.png){: .inline-image} **Add Command** button.

![Command Stack](/assets/studio/stack-add.png){: .center-image }

This opens a wizard dialog with the list of available commands. You can filter the list with the search box on top.

Commands are identified by their fully qualified XTCE name. This name matches the hierarchical structure of the commands as defined in the mission database of the connected Yamcs instance. In future versions we may include a tree representation in addition to the current flat representation.

Commands can have varying levels of criticality (called *significance* in XTCE terminology). The icon in the leftmost column indicates the defined criticality for the command.

<table class="inline">
    <tr>
        <th width="1">Icon</th>
        <th>Criticality</th>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/level1s.png"></td>
        <td>Watch</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/level2s.png"></td>
        <td>Warning</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/level3s.png"></td>
        <td>Distress</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/level4s.png"></td>
        <td>Critical</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/level5s.png"></td>
        <td>Severe</td>
    </tr>
</table>

If an explanatory message regarding the criticality was defined in the mission database, this will show in the top title area of the dialog when the command is selected.

Once you've chosen your command, hit **Next** to go the next page in the wizard, where you can specify any arguments that need to be provided for the command. Currently, only numbers or text can be entered.

<div class="hint">
    You can close the wizard from the first page as well by clicking <strong>Finish</strong> instead of <strong>Next</strong>. If the command requires any arguments, you will have a chance to add them afterwards as well by editing your stacked command.
</div>

![Specify Command Parameters](/assets/studio/stack-add-page2.png){: .center-image }

Click **Finish** to append your command to the end of your current stack.

![Stacked Command](/assets/studio/stack-with-command.png){: .center-image }

You can review your provided arguments by double clicking the command. To remove the selected command from the stack select ![Delete](/assets/studio/icons/remove.png){: .inline-image} **Delete**. Clear the entire stack with ![Delete All](/assets/studio/icons/removeall.png){: .inline-image} **Delete All**.

If a stacked command does not pass static validation checks (sometimes referred to as SPTVs -- Static PreTransmission Verification) it will be marked with error indicators. This will prevent the user from attempting further execution of the stack until the error is resolved.

![Stack in Error](/assets/studio/stack-in-error.png){: .center-image }

<div class="hint">
    It is not currently possible to move a command up or down the stack.
</div>

### Executing a Stack
When we're done composing our manual stack, we can start execution its commands. Execution is top-down, so select the first command of your stack.

<div class="hint">
    There is currently no clear separation between a 'stack editing' mode and a 'stack executing' mode. We are happy with this given the current set of features, but may revise this concept as we add more features (e.g. moving commands up and down the stack).
</div>

In the bottom bar click the **1. Arm** button. This will 'arm' your command, and is a first required step before issuing it. There is currently no timeout on how long a command stays armed before being reverted to disarmed. If the command you are arming has a defined criticality (watch, warning, distress, critical or severe), you will receive a confirmation dialog first.

Once your command is armed it will say so in the Stack State column.

<div class="hint">
    <em>Arming</em> a command is a client-side notion. There is no communication with Yamcs during this step. The intention of arming a command is to make the operator aware of his actions, especially when the command is significant. There is currently no support for arming multiple commands together and execution commands in batch. 
</div>

Now that your command is armed, hit **2. Issue**. There will be no more confirmation dialogs. If the server refuses your request you will receive an error message. This can happen for example when a command is only to be executed under a certain context, and within a certain time frame. These type of settings are currently exclusively defined in the Yamcs Mission Database.

To follow what happens to your command, open up the **Command History** view, explained in the next section.

When the command is issued, the Stack State column is updated, and you can arm the next command in the stack to repeat the process.

Skip the selected command by selecting ![Skip Command](/assets/studio/icons/stepover_co.png){: .inline-image} **Skip**. Reset the execution state by selecting ![Restart](/assets/studio/icons/restart_co.png){: .inline-image} **Restart**. This will reset all Stack State columns to **Disarmed**. 

### Importing and Exporting a Stack
When you want to save a stack for future use, you can select ![Export](/assets/studio/icons/export_wiz.png){: .inline-image} **Export** to save your stack in XML-format in any of your drives. Likewise, reuse a stack which you set aside by selecting ![Import](/assets/studio/icons/import_wiz.gif){: .inline-image} **Import**.  
