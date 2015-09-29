---
layout: default
permalink: /docs/server/Authorization/
sidebar: yes
---

Yamcs implements four types of privileges: System Privileges, TC Privileges, TM Sequence Containers (TM Packets) Privileges and TM Parameter Privileges.

The privileges are assigned to users through the use of roles: a user has specific roles, and some role is required for a specific privilege. If there is a match between the role assigned to the user and the role required for a privilege, then the user is allowed to pass the restriction.

All the user, role and privilege definitions are looked up in the LDAP database. Yamcs reads only LDAP objects of type `groupOfNames`. The access to the LDAP server is done using the properties from the `privileges.yaml` (see <xref linkend="privileges.yaml"/>). Yamcs requires read-only access to the LDAP.

The algorithm used by Yamcs to check if the user has a privilege (e.g. `EUTEF_Tlm_Pkt_HK_DHPU`) is as follows:

* From the path configured by `privilege.rolePath` find all the roles associated to the user. The roles defined in LDAP must contain references using the member attribute to objects `member=uid=corba_username` from the `privilege.userPath`.
* For each role found previously (e.g. `TRBIOLAB-Operator`), do a search in the corresponding system, tc, tm packet or tm parameter path using the match `member=cn=role_name`. The cn of the matching entries is used to build the list of privileges that the user has (e.g. `EUTEF_Tlm_.*` and `EUTEF_TRIBOLAB_.*`).
* Each item from the list of privileges that the user has (e.g. `EUTEF_Tlm_.*`) is considered as a regular expression and it is matched with the privilege that is required for the given operation (e.g. `EUTEF_Tlm_Pkt_HK_DHPU`). Note that the regular expression matching has been introduced in order to avoid multiplying the entries for TM/TC information. It can also be used for the system privileges (e.g. creating a entry `May.*` will allow everything) but it is not recommended.

The information found using the algorithm above is cached for 30 seconds such that when the user opens a USS display or a command stack containing many items, it is not necesary to repeat the same LDAP queries many times. The side effect, of course, is that a change in the LDAP database can take 30 seconds to be noticed by Yamcs.

#### System Privileges
Used to impose general limits, such as the privilege to command, privilege to control the channels with the Yamcs Monitor, etc. The following privileges are supported:

<table class="inline">
	<tr>
		<th>MayCommandPayload</th>
		<td>
			<p>This privilege is prerequisite for sending any command (in addition to that required for the command itself). Without this privilege, the user will not even be able to subscribe to commanding via the CORBA call subscribeCommanding.</p>
			<p>The privilege is checked each time the user prepares or sends a command.</p>
		</td>
	</tr>
	<tr>
		<th>MayModifyCommandHistory</th>
		<td>
			<p>This privilege allows to modify the command history with additional command history events. It is normally required only by the command history application.</p>
			<p>The privilege is checked each time the user tries to add a command history event.</p>
		</td>
	</tr>
	<tr>
		<th>MayControlCommandQueue</th>
		<td>
			<p>This privilege is required in order to be able to inspect and control the command queue. See <xref linkend="command-queues"/>.</p>
			<p>The privilege is checked each time the user calls one of the operations for controlling the command queues.</p>		
		</td>
	</tr>
	<tr>
		<th>MayControlChannels</th>
		<td>This privilege allows the user to control channels (e.g. enable/disable TM/TC, connect/disconnect sessions) other than their own. The channel control is done using the Yamcs Monitor.</td>
	</tr>
	<tr>
		<th>MayControlArchiving</th>
		<td>This privilege allows to enable archiving for the channels created on the fly.</td>
	</tr>
</table>



#### TC Privileges
In addition to the MayCommandPayload, each telecommand has an implicit privilege required to send the telecommand. The privilege has the same name as the opsname of the telecommand.

The TC privilege is checked each time when the user tries to send a command.

#### TM Sequence Containers Privileges
Similar to the TC, each TM Sequence Container has an implicit privilege required to monitor it. Note that due to the inheritance nature of the Sequence Containers, giving access to a higher level container, implicitly allows access to all the inherited containers. For example if a user has the privilege to monitor the CCSDS container which is the root container, he will get all the CCSDS packets even though he may not have explicit access to the EUTEF_Tlm_HK_DHPU container.

The TM Sequence Container Privileges are checked only at subscription time. Once the user is subscribed to a sequence container, changing the privileges in the LDAP database will have no effect on the ongoing subscription.

#### TM Parameters Privileges
Similar to the TC and to the TM Sequence Containers, each TM parameter has associated an implicit privilege required to monitor it.

Similar to the TM Sequence Containers, the privileges are checked against the LDAP database only at subscription time.
