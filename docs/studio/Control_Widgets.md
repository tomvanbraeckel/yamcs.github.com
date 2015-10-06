---
layout: default
sidebar: yes
permalink: /docs/studio/Control_Widgets/
---

#### Action Button
A button that can be used to trigger [Actions](/docs/studio/actions/). Use the **Toggle** property to have the option of adding a different action on press and release.

![Action Button](/assets/studio/action-button.png){: .center-image }

#### Menu Button
A button that will show a menu when it's clicked. The menu will be filled with either the actions from **Actions** property or the string values from the connected enumerated PV.

![Menu Button](/assets/studio/menu-button.png){: .center-image }

#### Text Input
A widget that allows the user to write data to the connected (writable) PV. For dates set the **Selector Type** to <tt>Datetime</tt>.

![Text Input](/assets/studio/text-input.png){: .center-image }

#### Spinner
The Spinner widget is similar to the Text Input, but allows updating the PV in incremental steps using up and down arrow buttons.

![Spinner](/assets/studio/spinner.png){: .center-image }


#### Scaled Slider
This widget allows adjusting the connected PV value using a configurable slider. 

![Scaled Slider](/assets/studio/scaled-slider.png){: .center-image }


#### Knob
Knobs allow adjusting the connected PV value by dragging the thumb around.

![Knob](/assets/studio/knob.png){: .center-image }


#### Scrollbar
Scrollbar that allows adjusting the connected PV value by. Useful as a building block for advanced display customizations.

![Scrollbar](/assets/studio/scrollbar.png){: .center-image }


#### Thumb Wheel
A widget that allows adjusting the decimal value of a PV digit by digit.

![Thumb Wheel](/assets/studio/thumb-wheel.png){: .center-image }

#### Boolean Switch
A Boolean Switch is able to write <tt>0</tt> or <tt>1</tt> to a single configurable bit of the connected PV or the whole PV if the **Bit** property is set to <tt>-1</tt>. 

If **Width** is greater than **Height**, the switch will render horizontally, otherwise vertically.

![Boolean Switch](/assets/studio/boolean-switch.png){: .center-image }

#### Boolean Button
A Boolean Button is able to write <tt>0</tt> or <tt>1</tt> to a single configurable bit of the connected PV or the whole PV if the **Bit** property is set to <tt>-1</tt>.

![Boolean Button](/assets/studio/boolean-button.png){: .center-image }

#### Image Boolean Button
Same as the Boolean Button widget, but you can customize the look further by specifying your own images with the **Off Image** and **On Image** properties. The selected images must be present in the workspace.

![Image Boolean Button](/assets/studio/image-boolean-button.png){: .center-image }

#### Check Box
A Check Box is able to write <tt>0</tt> or <tt>1</tt> to a single configurable bit of the connected PV or the whole PV if the **Bit** property is set to <tt>-1</tt>. Use the **Label** property to render a value next to the check box.

![Check Box](/assets/studio/check-box.png){: .center-image }

#### Radio Box
A Radio Box allows the user to choose between a configurable set of values. Use the **Items** property to specify these values.

![Radio Box](/assets/studio/radio-box.png){: .center-image }

#### Choice Button
Similar to the Radio Box, but with buttons. Toggling a button within the widget, untoggles the previously active button.

![Choice Box](/assets/studio/choice-button.png){: .center-image }

#### Combo
The Combo widget, as well, makes the user choose between one of its **Items**.

![Combo](/assets/studio/combo.png){: .center-image }
