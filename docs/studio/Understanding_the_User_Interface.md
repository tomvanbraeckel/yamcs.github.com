---
layout: default
sidebar: yes
permalink: /docs/studio/Understanding_the_User_Interface/
---

Yamcs Studio is composed out of multiple views that are arranged together in a perspective. The user has great flexibility in modifying the default arrangement to his liking.

* TOC
{:toc}

### Views
Views all share the same user interface organization. On the left you see a tab with the view icon, followed by a title, and then a close icon. On the outer right there are actions to ![Minimize](/assets/studio/view-minimize.png){: .inline-image} **Minimize** or  ![Maximize](/assets/studio/view-maximize.png){: .inline-image} **Maximize** the view. Some views (such as the one in the screenshot) also have a third pull-down icon ![Pulldown](/assets/studio/view-pulldown.png){: .inline-image} with view-specific actions in it. Most views, though, add dedicated colored icons next to the standard icons. The pull-down menu is used to hide less-often used actions.

![A View](/assets/studio/a-view.png){: .center-image }

<div class="hint">
    To reopen a view which you closed earlier, or to open another view choose <strong>Window &gt; Show View</strong>.
</div>

Views can be resized, moved and stacked. This allows you to customize your workspace to your own personal preference.

For example, let's say we want to put the Archive view in its own dedicated location. Click on the tab title, and while holding the mouse down, drag towards the right. If you move far enough, you will notice an outline suggesting the view's new position (this may look slightly different on your platform).

![Move Outline](/assets/studio/view-move-outline.png){: .center-image }

Release the mouse to confirm this view's new position.

![View Moved](/assets/studio/view-moved.png){: .center-image }

Let's say we want to move the Data Links view to the right as well. Again, click its title and drag your mouse next to the Archive tab. You will see a green bar suggesting this tab's new placement.

![Stack Outline](/assets/studio/view-move-stack-outline.png){: .center-image }

Release the mouse to confirm this view's new position.

![View Stacked](/assets/studio/view-stacked.png){: .center-image }

Feel free to experiment some more with the drag feature. As you try dragging to different locations, you will notice that Yamcs Studio has several hot spots where you can attach your views. For example, you can detach windows by dragging them outside of your application window. This provides additional screen space if your workstation supports multiple monitors.

When you close Yamcs Studio and reopen it, it will restore your preferred view and window arrangement.

<div class="hint">
    Yamcs Studio stores the information about your view arrangement in a <tt>.metadata</tt> folder inside your workspace. This is how it knows how to restore this information through restarts. If you share your workspace with other users through a version control system, you should consider <em>not</em> committing this <tt>.metadata</tt> folder. This way everybody can have his own preferred arrangement without colliding with each other. 
</div>

### Perspectives
Perspectives contain an organization of views. As you were performing the above actions with views, you were working within a certain *perspective*.

In the top right bar, you can see the Perspective Switcher. This is where you choose your current perspective. By default Yamcs Studio puts you in the OPI Runtime perspective, but by clicking the plus icon ![Choose Perspective](/assets/studio/perspective-choose.png) you can switch to the OPI Editor perspective, which has a different arrangement of views.

Again you can modify the views in this perspective to your heart's content, but as a general precaution we would advise that you distinguish between 'Running Displays' (OPI Runtime), and 'Editing Displays' (OPI Editor). In future versions of Yamcs Studio we may make this distinction more apparent, or even go as far as to offer two different products. 

Notice, as you go back to the OPI Runtime perspective, that your earlier view arrangement is nicely restored.

If at any time you want to reset your perspective to the defaults, select **Window > Reset Perspective...**.

<div class="hint">
    Some people prefer to have a separate window for every perspective. To do so, select <strong>Window > New Window</strong>. This action will duplicate your current window. You can then switch the new window to a different perspective, without impacting your original window.
</div>
