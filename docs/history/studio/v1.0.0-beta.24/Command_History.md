---
layout: default
sidebar: yes
version: v1.0.0-beta.24
permalink: /docs/studio/v1.0.0-beta.24/Command_History/
---

The Command History keeps track of all commands that were issued using Yamcs (not just by yourself, but by anyone).

![Command Stack](/assets/studio/cmdhist.png){: .center-image }

It will by default only show commands that were received on the realtime processor since you started your copy of Yamcs Studio. To load the command history for an earlier time range, select ![Import](/assets/studio/icons/import_wiz.gif){: .inline-image} **Import**.

Clear your view by clicking ![Import](/assets/studio/icons/clear.png){: .inline-image} **Clear**. You can always import the cleared commands again at a later time.

When Yamcs Studio becomes aware of a new command that was issued by Yamcs, it will automatically select and reveal it. You can prevent this default behaviour by toggling the ![Scroll Lock](/assets/studio/icons/lock_co.png){: .inline-image} **Scroll Lock**.

The displayed columns are as follows.

<table class="inline">
    <tr>
        <th>T</th>
        <td>Time when the command was issued</td>
    </tr>
    <tr>
        <th>Command</th>
        <td>The command in textual format</td>
    </tr>
    <tr>
        <th>Src</th>
        <td>The origin of the command. Typically in <em>user@host</em> format</td>
    </tr>
    <tr>
        <th>Src.ID</th>
        <td>The ID that was given to the command by the issuing application. This number is assigned by the source application. In case of Yamcs Studio it is an incremental number that resets to 1 on every restart of Yamcs Studio.</td>
    </tr>
    <tr>
        <th>PTV</th>
        <td>Result of the Pretransmission Verification as performed by Yamcs. For example, some commands may only be applicable for 10 seconds and needs certain other parameters to be set to specific values. When the PTV bubble colors red, these type of context-dependent checks could not be validated, and therefore the command was not actually issued.</td>
    </tr>
    <tr>
        <th>Seq.ID</th>
        <td>The id that was determined by Yamcs before further dispatching the command. This is an incremental number that resets on every restart of Yamcs.</td>
    </tr>
    <tr>
        <th>Further Columns</th>
        <td>
            <p>Indicate acknowledgments of ground hops as the command is being dispatched. The exact number and name of the columns depends largely on how Yamcs is deployed at your site. Yamcs typically calculates the state of these bubbles based on incoming telemetry.</p>
            <p>The bubble becomes green <img src="/assets/studio/icons/ok.png" class=".inline-image"> or red <img src="/assets/studio/icons/nok.png" class=".inline-image"> depending on the verification result. The column value shows the time difference with the issuing time <em>T</em>.</p>
        </td>
    </tr>
</table>
