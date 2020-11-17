defmodule EventSocketOutbound.Test.Support.SoftswitchEvent do
  @moduledoc false
  def command_reply_and_event_part1 do
    """
    Content-Type: command/reply
    Reply-Text: +OK

    Content-Length: 9366
    Content-Type: text/event-plain

    Event-Name: CHANNEL_EXECUTE_COMPLETE
    Core-UUID: 7610dcfe-e294-11e8-b372-4b084ebbf04f
    FreeSWITCH-Hostname: localhost.localdomain
    FreeSWITCH-Switchname: localhost.localdomain
    FreeSWITCH-IPv4: 192.168.1.205
    FreeSWITCH-IPv6: %3A%3A1
    Event-Date-Local: 2018-11-07%2016%3A59%3A11
    Event-Date-GMT: Wed,%2007%20Nov%202018%2015%3A59%3A11%20GMT
    Event-Date-Timestamp: 1541606351045444
    Event-Calling-File: switch_core_session.c
    Event-Calling-Function: switch_core_session_exec
    Event-Calling-Line-Number: 2874
    Event-Sequence: 4681
    Channel-State: CS_EXECUTE
    Channel-Call-State: ACTIVE
    Channel-State-Number: 4
    Channel-Name: sofia/external/nobody%40192.168.1.235%3A5060
    Unique-ID: 102037b6-e2a6-11e8-b44d-4b084ebbf04f
    Call-Direction: inbound
    Presence-Call-Direction: inbound
    Channel-HIT-Dialplan: true
    Channel-Call-UUID: 102037b6-e2a6-11e8-b44d-4b084ebbf04f
    Answer-State: answered
    Channel-Read-Codec-Name: G722
    Channel-Read-Codec-Rate: 16000
    Channel-Read-Codec-Bit-Rate: 64000
    Channel-Write-Codec-Name: G722
    Channel-Write-Codec-Rate: 16000
    Channel-Write-Codec-Bit-Rate: 64000
    Caller-Direction: inbound
    Caller-Logical-Direction: inbound
    Caller-Dialplan: XML
    Caller-Caller-ID-Name: unknown
    Caller-Orig-Caller-ID-Name: unknown
    Caller-Network-Addr: 192.168.1.235
    Caller-Destination-Number: 123
    Caller-Unique-ID: 102037b6-e2a6-11e8-b44d-4b084ebbf04f
    Caller-Source: mod_sofia
    Caller-Con\
    """
  end

  def command_reply_and_event_part2 do
    """
    text: from_external
    Caller-Channel-Name: sofia/external/nobody%40192.168.1.235%3A5060
    Caller-Profile-Index: 1
    Caller-Profile-Created-Time: 1541606349772311
    Caller-Channel-Created-Time: 1541606349772311
    Caller-Channel-Answered-Time: 1541606349782563
    Caller-Channel-Progress-Time: 0
    Caller-Channel-Progress-Media-Time: 1541606349782563
    Caller-Channel-Hangup-Time: 0
    Caller-Channel-Transfer-Time: 0
    Caller-Channel-Resurrect-Time: 0
    Caller-Channel-Bridged-Time: 0
    Caller-Channel-Last-Hold: 0
    Caller-Channel-Hold-Accum: 0
    Caller-Screen-Bit: true
    Caller-Privacy-Hide-Name: false
    Caller-Privacy-Hide-Number: false
    variable_direction: inbound
    variable_uuid: 102037b6-e2a6-11e8-b44d-4b084ebbf04f
    variable_session_id: 23
    variable_sip_from_user: nobody
    variable_sip_from_port: 5060
    variable_sip_from_uri: nobody%40192.168.1.235%3A5060
    variable_sip_from_host: 192.168.1.235
    variable_text_media_flow: disabled
    variable_channel_name: sofia/external/nobody%40192.168.1.235%3A5060
    variable_sip_local_network_addr: 192.168.1.205
    variable_sip_network_ip: 192.168.1.235
    variable_sip_network_port: 5060
    variable_sip_invite_stamp: 1541606349772311
    variable_sip_received_ip: 192.168.1.235
    variable_sip_received_port: 5060
    variable_sip_via_protocol: udp
    variable_sofia_profile_name: external
    variable_sofia_profile_url: sip%3Amod_sofia%40192.168.1.205%3A5060
    variable_recovery_profile_name: external
    variable_sip_allow: MESSAGE,%20REFER,%20INFO,%20NOTIFY,%20SUBSCRIBE,%20UPDATE,%20PR\
    """
  end

  def command_reply_and_event_part3 do
    """
    ACK,%20PUBLISH,%20CANCEL,%20BYE,%20OPTIONS,%20ACK,%20INVITE
    variable_sip_req_user: 123
    variable_sip_req_uri: 123%40192.168.1.205
    variable_sip_req_host: 192.168.1.205
    variable_sip_to_user: 123
    variable_sip_to_uri: 123%40192.168.1.205
    variable_sip_to_host: 192.168.1.205
    variable_sip_contact_user: nobody
    variable_sip_contact_port: 5060
    variable_sip_contact_uri: nobody%40192.168.1.235%3A5060
    variable_sip_contact_host: 192.168.1.235
    variable_sip_user_agent: HUAWEI%20TEx0
    variable_sip_via_host: 192.168.1.235
    variable_sip_via_port: 5060
    variable_sip_via_rport: 5060
    variable_max_forwards: 70
    variable_call_uuid: 102037b6-e2a6-11e8-b44d-4b084ebbf04f
    variable_sip_h_X-Holocom-Username: 102037b6-e2a6-11e8-b44d-4b084ebbf04f
    variable_holocom_call_mgt: sip
    variable_sound_prefix: /opt/freeswitch/sounds/en/us/callie/
    variable_rtp_use_codec_name: G722
    variable_rtp_use_codec_rate: 8000
    variable_rtp_use_codec_ptime: 20
    variable_rtp_use_codec_channels: 1
    variable_rtp_last_audio_codec_string: G722%408000h%4020i%401c
    variable_read_codec: G722
    variable_original_read_codec: G722
    variable_read_rate: 16000
    variable_original_read_rate: 16000
    variable_write_codec: G722
    variable_write_rate: 16000
    variable_video_read_codec: H264
    variable_video_read_rate: 90000
    variable_video_write_codec: H264
    variable_video_write_rate: 90000
    variable_rtp_last_video_codec_string: H264%4090000h
    variable_rtp_use_video_codec_name: H264
    variable_rtp_use_video_codec_fmtp: profile-level-id%3\
    """
  end

  def command_reply_and_event_part4 do
    """
    D42001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840
    variable_rtp_use_video_codec_rate: 90000
    variable_rtp_use_video_codec_ptime: 0
    variable_local_media_ip: 192.168.1.205
    variable_local_media_port: 19770
    variable_advertised_media_ip: 192.168.1.205
    variable_rtp_use_timer_name: soft
    variable_rtp_use_pt: 9
    variable_rtp_use_ssrc: 938420661
    variable_local_video_ip: 192.168.1.205
    variable_local_video_port: 26912
    variable_rtp_use_video_pt: 109
    variable_rtp_use_video_ssrc: 167638462
    variable_endpoint_disposition: ANSWER
    variable_switch_r_sdp: v%3D0%0D%0Ao%3Dhuawei%20871432192%201%20IN%20IP4%20192.168.1.235%0D%0As%3D-%0D%0Ac%3DIN%20IP4%20192.168.1.235%0D%0Ab%3DCT%3A1920%0D%0At%3D0%200%0D%0Am%3Daudio%2010002%20RTP/AVP%20117%20118%20119%209%208%200%2097%0D%0Aa%3Drtpmap%3A117%20G7221/16000%0D%0Aa%3Dfmtp%3A117%20bitrate%3D32000%0D%0Aa%3Drtpmap%3A118%20G7221/32000%0D%0Aa%3Dfmtp%3A118%20bitrate%3D48000%0D%0Aa%3Drtpmap%3A119%20G7221/16000%0D%0Aa%3Dfmtp%3A119%20bitrate%3D24000%0D%0Aa%3Drtpmap%3A9%20G722/8000%0D%0Aa%3Drtpmap%3A8%20PCMA/8000%0D%0Aa%3Drtpmap%3A0%20PCMU/8000%0D%0Aa%3Drtpmap%3A97%20telephone-event/8000%0D%0Aa%3Dfmtp%3A97%200-15%0D%0Am%3Dvideo%2010004%20RTP/AVP%20109%20110%20107%0D%0Ab%3DAS%3A1920%0D%0Aa%3Drtpmap%3A109%20H264/90000%0D%0Aa%3Dfmtp%3A109%20profile-level-id%3D42001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840%0D%0Aa%3Drtpmap%3A110%20H264/90000%0D%0Aa%3Dfmtp%3A110%20profile-level-id%3D42001F%3Bmax-br%3D1920%3Bmax-mb\
    """
  end

  def command_reply_and_event_part5 do
    """
    ps%3D115200%3Bmax-fs%3D3840%3Bpacketization-mode%3D1%0D%0Aa%3Drtpmap%3A107%20H264/90000%0D%0Aa%3Dfmtp%3A107%20profile-level-id%3D64001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840%3Bpacketization-mode%3D1%0D%0Aa%3Drtcp-fb%3A*%20nack%0D%0Aa%3Drtcp-fb%3A*%20ccm%20fir%0D%0Aa%3Drtcp-fb%3A*%20ccm%20tmmbr%0D%0Aa%3Drtcp-fb%3A*%20nack%20pli%0D%0Aa%3Dec-rtcp-fb%3A*%20vsr%0D%0Aa%3Dextmapasb%3A1/sendrecv%0D%0Aa%3Dcontent%3Amain%0D%0Aa%3Dlabel%3A11%0D%0Am%3Dapplication%205071%20TCP/TLS/BFCP%20*%0D%0Aa%3Dfingerprint%3Asha-1%2083%3A12%3A35%3A93%3A8C%3A47%3AE2%3A9D%3AAE%3A7D%3ADD%3AD9%3ADD%3A36%3AB5%3ADD%3A05%3AB4%3A16%3AD2%0D%0Aa%3Dconfid%3A2%0D%0Aa%3Duserid%3A1%0D%0Aa%3Dfloorid%3A2%20mstrm%3A12%0D%0Aa%3Dfloorctrl%3Ac-s%0D%0Aa%3Dsetup%3Aactpass%0D%0Aa%3Dconnection%3Anew%0D%0Am%3Dapplication%207684%20RTP/AVP%20100%0D%0Aa%3Drtpmap%3A100%20H224/4800%0D%0A
    variable_ep_codec_string: mod_spandsp.G722%408000h%4020i%4064000b,CORE_PCM_MODULE.PCMA%408000h%4020i%4064000b,CORE_PCM_MODULE.PCMU%408000h%4020i%4064000b,mod_h26x.H264~profile-level-id%3D42001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840,mod_h26x.H264~profile-level-id%3D42001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840%3Bpacketization-mode%3D1,mod_h26x.H264~profile-level-id%3D64001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840%3Bpacketization-mode%3D1
    variable_rtp_use_codec_string: H264,OPUS%4016000h%4020i,G722,PCMU,PCMA,VP8
    variable_remote_audio_media_flow: sendrecv
    var\
    """
  end

  def command_reply_and_event_part6 do
    """
    iable_audio_media_flow: sendrecv
    variable_remote_media_ip: 192.168.1.235
    variable_remote_media_port: 10002
    variable_rtp_audio_recv_pt: 9
    variable_dtmf_type: rfc2833
    variable_rtp_2833_send_payload: 97
    variable_rtp_2833_recv_payload: 97
    variable_remote_video_media_flow: sendrecv
    variable_video_media_flow: sendrecv
    variable_video_possible: true
    variable_remote_video_ip: 192.168.1.235
    variable_remote_video_port: 10004
    variable_rtp_video_fmtp: profile-level-id%3D42001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840
    variable_rtp_video_pt: 109
    variable_rtp_video_recv_pt: 109
    variable_rtp_remote_video_rtcp_port: 10005
    variable_rtp_local_sdp_str: v%3D0%0D%0Ao%3DFreeSWITCH%201541586579%201541586581%20IN%20IP4%20192.168.1.205%0D%0As%3DFreeSWITCH%0D%0Ac%3DIN%20IP4%20192.168.1.205%0D%0At%3D0%200%0D%0Am%3Daudio%2019770%20RTP/AVP%209%2097%0D%0Aa%3Drtpmap%3A9%20G722/8000%0D%0Aa%3Drtpmap%3A97%20telephone-event/8000%0D%0Aa%3Dfmtp%3A97%200-16%0D%0Aa%3Dptime%3A20%0D%0Aa%3Dsendrecv%0D%0Am%3Dvideo%2026912%20RTP/AVP%20109%0D%0Ab%3DAS%3A1024%0D%0Aa%3Drtpmap%3A109%20H264/90000%0D%0Aa%3Dfmtp%3A109%20profile-level-id%3D42001F%3Bmax-br%3D1920%3Bmax-mbps%3D115200%3Bmax-fs%3D3840%0D%0Aa%3Dsendrecv%0D%0Aa%3Drtcp%3A26913%20IN%20IP4%20192.168.1.205%0D%0Aa%3Drtcp-fb%3A109%20ccm%20fir%0D%0Aa%3Drtcp-fb%3A109%20ccm%20tmmbr%0D%0Aa%3Drtcp-fb%3A109%20nack%0D%0Aa%3Drtcp-fb%3A109%20nack%20pli%0D%0A
    variable_sip_to_tag: X3vr15XNDN5pj
    variable_sip_from_tag: w9w31bpm
    variable\
    """
  end

  def command_reply_and_event_part7 do
    """
    _sip_cseq: 4
    variable_sip_call_id: lx8cfJtastATElaUfXRYxDWm0nFpbt3qjdeagGA3bYcw
    variable_sip_full_via: SIP/2.0/UDP%20192.168.1.235%3A5060%3Bbranch%3Dz9hG4bKnbevnm33cmd19ac0nxbno9mxm%3Brport%3D5060
    variable_sip_full_from: %3Csip%3A192.168.1.235%3A5060%3E%3Btag%3Dw9w31bpm
    variable_sip_full_to: %3Csip%3A123%40192.168.1.205%3E%3Btag%3DX3vr15XNDN5pj
    variable_playback_last_offset_pos: 19609
    variable_playback_seconds: 1
    variable_playback_ms: 1225
    variable_playback_samples: 19609
    variable_socket_host: 192.168.1.204
    variable_current_loop: 1
    variable_total_loops: 1
    variable_current_application: answer
    Application: answer
    Application-Response: _none_
    Application-UUID: 10e170a2-e2a6-11e8-b455-4b084ebbf04f

    """
  end

  def channel_state_header do
    """
    Content-Length: 646
    Content-Type: text/event-plain

    """
  end

  def channel_state do
    """
    Channel-State: CS_EXECUTE
    Channel-State-Number: 4
    Channel-Name: sofia/default/1006%4010.0.1.250%3A5060
    Unique-ID: 74775b0d-b112-46e2-95af-c28258650b1b
    Call-Direction: inbound
    Answer-State: ringing
    Event-Name: CHANNEL_STATE
    Core-UUID: 2130a7d1-c1f7-44cd-8fae-8ed5946f3cec
    FreeSWITCH-Hostname: localhost.localdomain
    FreeSWITCH-IPv4: 10.0.1.250
    FreeSWITCH-IPv6: 127.0.0.1
    Event-Date-Local: 2007-12-16%2022%3A33%3A18
    Event-Date-GMT: Mon,%2017%20Dec%202007%2004%3A33%3A18%20GMT
    Event-Date-timestamp: 1197865998931097
    Event-Calling-File: switch_channel.c
    Event-Calling-Function: switch_channel_perform_set_running_state
    Event-Calling-Line-Number: 620

    """
  end

  def channel_data do
    """
    Event-Name: CHANNEL_DATA
    Core-UUID: 6cd7d004-e3c9-11e7-b0f3-73bec77e82ec
    FreeSWITCH-Hostname: localhost.localdomain
    FreeSWITCH-Switchname: localhost.localdomain
    FreeSWITCH-IPv4: 192.168.1.146
    FreeSWITCH-IPv6: %3A%3A1
    Event-Date-Local: 2017-12-20%2010%3A36%3A29
    Event-Date-GMT: Wed,%2020%20Dec%202017%2009%3A36%3A29%20GMT
    Event-Date-Timestamp: 1513762589272060
    Event-Calling-File: mod_event_socket.c
    Event-Calling-Function: parse_command
    Event-Calling-Line-Number: 2011
    Event-Sequence: 32945
    Channel-Direction: inbound
    Channel-Logical-Direction: inbound
    Channel-Username: 1000
    Channel-Dialplan: XML
    Channel-Caller-ID-Name: 1000
    Channel-Caller-ID-Number: 1000
    Channel-Orig-Caller-ID-Name: 1000
    Channel-Orig-Caller-ID-Number: 1000
    Channel-Network-Addr: 192.168.1.176
    Channel-ANI: 1000
    Channel-Destination-Number: 222
    Channel-Unique-ID: 4192e98c-e569-11e7-b747-73bec77e82ec
    Channel-Source: mod_sofia
    Channel-Context: default
    Channel-Channel-Name: sofia/internal/1000%40192.168.1.146%3A5060
    Channel-Profile-Index: 1
    Channel-Profile-Created-Time: 1513762589272060
    Channel-Channel-Created-Time: 1513762589272060
    Channel-Channel-Answered-Time: 0
    Channel-Channel-Progress-Time: 0
    Channel-Channel-Progress-Media-Time: 0
    Channel-Channel-Hangup-Time: 0
    Channel-Channel-Transfer-Time: 0
    Channel-Channel-Resurrect-Time: 0
    Channel-Channel-Bridged-Time: 0
    Channel-Channel-Last-Hold: 0
    Channel-Channel-Hold-Accum: 0
    Channel-Screen-Bit: true
    Channel-Privacy-Hide-Name: false
    Channel-Privacy-Hide-Number: false
    Channel-State: CS_EXECUTE
    Channel-Call-State: RINGING
    Channel-State-Number: 4
    Channel-Name: sofia/internal/1000%40192.168.1.146%3A5060
    Unique-ID: 4192e98c-e569-11e7-b747-73bec77e82ec
    Call-Direction: inbound
    Presence-Call-Direction: inbound
    Channel-HIT-Dialplan: true
    Channel-Call-UUID: 4192e98c-e569-11e7-b747-73bec77e82ec
    Answer-State: ringing
    Channel-Read-Codec-Name: PCMU
    Channel-Read-Codec-Rate: 8000
    Channel-Read-Codec-Bit-Rate: 64000
    Channel-Write-Codec-Name: PCMU
    Channel-Write-Codec-Rate: 8000
    Channel-Write-Codec-Bit-Rate: 64000
    Caller-Direction: inbound
    Caller-Logical-Direction: inbound
    Caller-Username: 1000
    Caller-Dialplan: XML
    Caller-Caller-ID-Name: 1000
    Caller-Caller-ID-Number: 1000
    Caller-Orig-Caller-ID-Name: 1000
    Caller-Orig-Caller-ID-Number: 1000
    Caller-Network-Addr: 192.168.1.176
    Caller-ANI: 1000
    Caller-Destination-Number: 222
    Caller-Unique-ID: 4192e98c-e569-11e7-b747-73bec77e82ec
    Caller-Source: mod_sofia
    Caller-Context: default
    Caller-Channel-Name: sofia/internal/1000%40192.168.1.146%3A5060
    Caller-Profile-Index: 1
    Caller-Profile-Created-Time: 1513762589272060
    Caller-Channel-Created-Time: 1513762589272060
    Caller-Channel-Answered-Time: 0
    Caller-Channel-Progress-Time: 0
    Caller-Channel-Progress-Media-Time: 0
    Caller-Channel-Hangup-Time: 0
    Caller-Channel-Transfer-Time: 0
    Caller-Channel-Resurrect-Time: 0
    Caller-Channel-Bridged-Time: 0
    Caller-Channel-Last-Hold: 0
    Caller-Channel-Hold-Accum: 0
    Caller-Screen-Bit: true
    Caller-Privacy-Hide-Name: false
    Caller-Privacy-Hide-Number: false
    variable_direction: inbound
    variable_uuid: 4192e98c-e569-11e7-b747-73bec77e82ec
    variable_session_id: 72
    variable_sip_from_user: 1000
    variable_sip_from_port: 5060
    variable_sip_from_uri: 1000%40192.168.1.146%3A5060
    variable_sip_from_host: 192.168.1.146
    variable_video_media_flow: sendrecv
    variable_channel_name: sofia/internal/1000%40192.168.1.146%3A5060
    variable_sip_call_id: 6988765531339-10912704712504%40192.168.1.176
    variable_ep_codec_string: CORE_PCM_MODULE.PCMU%408000h%4020i%4064000b,CORE_PCM_MODULE.PCMA%408000h%4020i%4064000b,mod_spandsp.G722%408000h%4020i%4064000b
    variable_sip_local_network_addr: 192.168.1.146
    variable_sip_network_ip: 192.168.1.176
    variable_sip_network_port: 5060
    variable_sip_invite_stamp: 1513762589272060
    variable_sip_received_ip: 192.168.1.176
    variable_sip_received_port: 5060
    variable_sip_via_protocol: udp
    variable_sip_authorized: true
    variable_Event-Name: REQUEST_PARAMS
    variable_Core-UUID: 6cd7d004-e3c9-11e7-b0f3-73bec77e82ec
    variable_FreeSWITCH-Hostname: localhost.localdomain
    variable_FreeSWITCH-Switchname: localhost.localdomain
    variable_FreeSWITCH-IPv4: 192.168.1.146
    variable_FreeSWITCH-IPv6: %3A%3A1
    variable_Event-Date-Local: 2017-12-20%2010%3A36%3A29
    variable_Event-Date-GMT: Wed,%2020%20Dec%202017%2009%3A36%3A29%20GMT
    variable_Event-Date-Timestamp: 1513762589272060
    variable_Event-Calling-File: sofia.c
    variable_Event-Calling-Function: sofia_handle_sip_i_invite
    variable_Event-Calling-Line-Number: 10096
    variable_Event-Sequence: 32933
    variable_sip_number_alias: 1000
    variable_sip_auth_username: 1000
    variable_sip_auth_realm: 192.168.1.146
    variable_number_alias: 1000
    variable_requested_user_name: 1000
    variable_requested_domain_name: 192.168.1.146
    variable_record_stereo: true
    variable_default_gateway: example.com
    variable_default_areacode: 918
    variable_transfer_fallback_extension: operator
    variable_toll_allow: domestic,international,local
    variable_accountcode: 1000
    variable_user_context: default
    variable_effective_caller_id_name: Extension%201000
    variable_effective_caller_id_number: 1000
    variable_outbound_caller_id_name: FreeSWITCH
    variable_outbound_caller_id_number: 0000000000
    variable_callgroup: techsupport
    variable_user_name: 1000
    variable_domain_name: 192.168.1.146
    variable_sip_from_user_stripped: 1000
    variable_sip_from_tag: 206617209
    variable_sofia_profile_name: internal
    variable_recovery_profile_name: internal
    variable_sip_full_via: SIP/2.0/UDP%20192.168.1.176%3A5060%3Bbranch%3Dz9hG4bK3041429401193536006
    variable_sip_from_display: 1000
    variable_sip_full_from: 1000%20%3Csip%3A1000%40192.168.1.146%3A5060%3E%3Btag%3D206617209
    variable_sip_to_display: 222
    variable_sip_full_to: %22222%22%20%3Csip%3A222%40192.168.1.146%3Buser%3Dphone%3E
    variable_sip_allow: INVITE,%20ACK,%20OPTIONS,%20BYE,%20CANCEL,%20REFER,%20NOTIFY,%20INFO,%20PRACK,%20UPDATE,%20MESSAGE
    variable_sip_req_params: user%3Dphone
    variable_sip_req_user: 222
    variable_sip_req_uri: 222%40192.168.1.146
    variable_sip_req_host: 192.168.1.146
    variable_sip_to_params: user%3Dphone
    variable_sip_to_user: 222
    variable_sip_to_uri: 222%40192.168.1.146
    variable_sip_to_host: 192.168.1.146
    variable_sip_contact_user: 1000
    variable_sip_contact_port: 5060
    variable_sip_contact_uri: 1000%40192.168.1.176%3A5060
    variable_sip_contact_host: 192.168.1.176
    variable_sip_user_agent: Voismart%20VEP2100%202.3.1454.21
    variable_sip_via_host: 192.168.1.176
    variable_sip_via_port: 5060
    variable_max_forwards: 70
    variable_sip_h_P-Early-Media: supported
    variable_switch_r_sdp: v%3D0%0D%0Ao%3Dsdp_admin%20288265156%2011044216%20IN%20IP4%20192.168.1.176%0D%0As%3DA%20conversation%0D%0Ac%3DIN%20IP4%20192.168.1.176%0D%0At%3D0%200%0D%0Am%3Daudio%2010120%20RTP/AVP%200%208%2018%204%202%209%20101%0D%0Aa%3Drtpmap%3A0%20PCMU/8000%0D%0Aa%3Drtpmap%3A8%20PCMA/8000%0D%0Aa%3Drtpmap%3A18%20G729/8000%0D%0Aa%3Dfmtp%3A18%20annexb%3Dno%0D%0Aa%3Drtpmap%3A4%20G723/8000%0D%0Aa%3Dfmtp%3A4%20bitrate%3D6.3%0D%0Aa%3Drtpmap%3A2%20G726-32/8000%0D%0Aa%3Drtpmap%3A9%20G722/8000%0D%0Aa%3Drtpmap%3A101%20telephone-event/8000%0D%0Aa%3Dfmtp%3A101%200-15%0D%0A
    variable_rtp_use_codec_string: OPUS,G722,PCMU,PCMA,VP8
    variable_audio_media_flow: sendrecv
    variable_remote_media_ip: 192.168.1.176
    variable_remote_media_port: 10120
    variable_rtp_audio_recv_pt: 0
    variable_rtp_use_codec_name: PCMU
    variable_rtp_use_codec_rate: 8000
    variable_rtp_use_codec_ptime: 20
    variable_rtp_use_codec_channels: 1
    variable_rtp_last_audio_codec_string: PCMU%408000h%4020i%401c
    variable_read_codec: PCMU
    variable_original_read_codec: PCMU
    variable_read_rate: 8000
    variable_original_read_rate: 8000
    variable_write_codec: PCMU
    variable_write_rate: 8000
    variable_dtmf_type: rfc2833
    variable_endpoint_disposition: RECEIVED
    variable_call_uuid: 4192e98c-e569-11e7-b747-73bec77e82ec
    variable_current_application_data: 192.168.1.208%3A5555%20async%20full
    variable_current_application: socket
    variable_socket_host: 192.168.1.208
    Content-Type: command/reply
    Reply-Text: %2BOK%0A
    Socket-Mode: async
    Control: full

    """
  end

  def command_reply do
    """
    Content-Type: command/reply
    Reply-Text: +OK
    Job-UUID: e3054f48-151e-11dc-842a-d3a3942d3d63

    """
  end

  def disconnect_header do
    """
    Content-Type: text/disconnect-notice
    Controlled-Session-UUID: 4192e98c-e569-11e7-b747-73bec77e82ec
    Content-Disposition: disconnect
    Content-Length: 67

    """
  end

  def disconnect do
    """
    Disconnected, goodbye.
    See you at ClueCon! http://www.cluecon.com/

    """
  end

  def api_response do
    """
    Content-Type: api/response
    Content-Length: 6872

    Event-Name: CHANNEL_DATA
    Core-UUID: 6cd7d004-e3c9-11e7-b0f3-73bec77e82ec
    FreeSWITCH-Hostname: localhost.localdomain
    FreeSWITCH-Switchname: localhost.localdomain
    FreeSWITCH-IPv4: 192.168.1.146
    FreeSWITCH-IPv6: %3A%3A1
    Event-Date-Local: 2017-12-22%2011%3A46%3A12
    Event-Date-GMT: Fri,%2022%20Dec%202017%2010%3A46%3A12%20GMT
    Event-Date-Timestamp: 1513939572093846
    Event-Calling-File: mod_commands.c
    Event-Calling-Function: uuid_dump_function
    Event-Calling-Line-Number: 6138
    Event-Sequence: 62655
    Channel-State: CS_EXECUTE
    Channel-Call-State: RINGING
    Channel-State-Number: 4
    Channel-Name: sofia/internal/1000%40192.168.1.146%3A5060
    Unique-ID: 538c7d22-e705-11e7-bc33-73bec77e82ec
    Call-Direction: inbound
    Presence-Call-Direction: inbound
    Channel-HIT-Dialplan: true
    Channel-Call-UUID: 538c7d22-e705-11e7-bc33-73bec77e82ec
    Answer-State: ringing
    Channel-Read-Codec-Name: PCMU
    Channel-Read-Codec-Rate: 8000
    Channel-Read-Codec-Bit-Rate: 64000
    Channel-Write-Codec-Name: PCMU
    Channel-Write-Codec-Rate: 8000
    Channel-Write-Codec-Bit-Rate: 64000
    Caller-Direction: inbound
    Caller-Logical-Direction: inbound
    Caller-Username: 1000
    Caller-Dialplan: XML
    Caller-Caller-ID-Name: 1000
    Caller-Caller-ID-Number: 1000
    Caller-Orig-Caller-ID-Name: 1000
    Caller-Orig-Caller-ID-Number: 1000
    Caller-Network-Addr: 192.168.1.176
    Caller-ANI: 1000
    Caller-Destination-Number: 222
    Caller-Unique-ID: 538c7d22-e705-11e7-bc33-73bec77e82ec
    Caller-Source: mod_sofia
    Caller-Context: default
    Caller-Channel-Name: sofia/internal/1000%40192.168.1.146%3A5060
    Caller-Profile-Index: 1
    Caller-Profile-Created-Time: 1513939572071949
    Caller-Channel-Created-Time: 1513939572071949
    Caller-Channel-Answered-Time: 0
    Caller-Channel-Progress-Time: 0
    Caller-Channel-Progress-Media-Time: 0
    Caller-Channel-Hangup-Time: 0
    Caller-Channel-Transfer-Time: 0
    Caller-Channel-Resurrect-Time: 0
    Caller-Channel-Bridged-Time: 0
    Caller-Channel-Last-Hold: 0
    Caller-Channel-Hold-Accum: 0
    Caller-Screen-Bit: true
    Caller-Privacy-Hide-Name: false
    Caller-Privacy-Hide-Number: false
    variable_direction: inbound
    variable_uuid: 538c7d22-e705-11e7-bc33-73bec77e82ec
    variable_session_id: 85
    variable_sip_from_user: 1000
    variable_sip_from_port: 5060
    variable_sip_from_uri: 1000%40192.168.1.146%3A5060
    variable_sip_from_host: 192.168.1.146
    variable_video_media_flow: sendrecv
    variable_channel_name: sofia/internal/1000%40192.168.1.146%3A5060
    variable_sip_call_id: 2036838528925-19220262117232%40192.168.1.176
    variable_ep_codec_string: CORE_PCM_MODULE.PCMU%408000h%4020i%4064000b,CORE_PCM_MODULE.PCMA%408000h%4020i%4064000b,mod_spandsp.G722%408000h%4020i%4064000b
    variable_sip_local_network_addr: 192.168.1.146
    variable_sip_network_ip: 192.168.1.176
    variable_sip_network_port: 5060
    variable_sip_invite_stamp: 1513939572071949
    variable_sip_received_ip: 192.168.1.176
    variable_sip_received_port: 5060
    variable_sip_via_protocol: udp
    variable_sip_authorized: true
    variable_Event-Name: REQUEST_PARAMS
    variable_Core-UUID: 6cd7d004-e3c9-11e7-b0f3-73bec77e82ec
    variable_FreeSWITCH-Hostname: localhost.localdomain
    variable_FreeSWITCH-Switchname: localhost.localdomain
    variable_FreeSWITCH-IPv4: 192.168.1.146
    variable_FreeSWITCH-IPv6: %3A%3A1
    variable_Event-Date-Local: 2017-12-22%2011%3A46%3A12
    variable_Event-Date-GMT: Fri,%2022%20Dec%202017%2010%3A46%3A12%20GMT
    variable_Event-Date-Timestamp: 1513939572071949
    variable_Event-Calling-File: sofia.c
    variable_Event-Calling-Function: sofia_handle_sip_i_invite
    variable_Event-Calling-Line-Number: 10096
    variable_Event-Sequence: 62640
    variable_sip_number_alias: 1000
    variable_sip_auth_username: 1000
    variable_sip_auth_realm: 192.168.1.146
    variable_number_alias: 1000
    variable_requested_user_name: 1000
    variable_requested_domain_name: 192.168.1.146
    variable_record_stereo: true
    variable_default_gateway: example.com
    variable_default_areacode: 918
    variable_transfer_fallback_extension: operator
    variable_toll_allow: domestic,international,local
    variable_accountcode: 1000
    variable_user_context: default
    variable_effective_caller_id_name: Extension%201000
    variable_effective_caller_id_number: 1000
    variable_outbound_caller_id_name: FreeSWITCH
    variable_outbound_caller_id_number: 0000000000
    variable_callgroup: techsupport
    variable_user_name: 1000
    variable_domain_name: 192.168.1.146
    variable_sip_from_user_stripped: 1000
    variable_sip_from_tag: 1999610308
    variable_sofia_profile_name: internal
    variable_recovery_profile_name: internal
    variable_sip_full_via: SIP/2.0/UDP%20192.168.1.176%3A5060%3Bbranch%3Dz9hG4bK2315526031123027026
    variable_sip_from_display: 1000
    variable_sip_full_from: 1000%20%3Csip%3A1000%40192.168.1.146%3A5060%3E%3Btag%3D1999610308
    variable_sip_to_display: 222
    variable_sip_full_to: %22222%22%20%3Csip%3A222%40192.168.1.146%3Buser%3Dphone%3E
    variable_sip_allow: INVITE,%20ACK,%20OPTIONS,%20BYE,%20CANCEL,%20REFER,%20NOTIFY,%20INFO,%20PRACK,%20UPDATE,%20MESSAGE
    variable_sip_req_params: user%3Dphone
    variable_sip_req_user: 222
    variable_sip_req_uri: 222%40192.168.1.146
    variable_sip_req_host: 192.168.1.146
    variable_sip_to_params: user%3Dphone
    variable_sip_to_user: 222
    variable_sip_to_uri: 222%40192.168.1.146
    variable_sip_to_host: 192.168.1.146
    variable_sip_contact_user: 1000
    variable_sip_contact_port: 5060
    variable_sip_contact_uri: 1000%40192.168.1.176%3A5060
    variable_sip_contact_host: 192.168.1.176
    variable_sip_user_agent: Voismart%20VEP2100%202.3.1454.21
    variable_sip_via_host: 192.168.1.176
    variable_sip_via_port: 5060
    variable_max_forwards: 70
    variable_sip_h_P-Early-Media: supported
    variable_switch_r_sdp: v%3D0%0D%0Ao%3Dsdp_admin%20266193386%2017213612%20IN%20IP4%20192.168.1.176%0D%0As%3DA%20conversation%0D%0Ac%3DIN%20IP4%20192.168.1.176%0D%0At%3D0%200%0D%0Am%3Daudio%2010140%20RTP/AVP%200%208%2018%204%202%209%20101%0D%0Aa%3Drtpmap%3A0%20PCMU/8000%0D%0Aa%3Drtpmap%3A8%20PCMA/8000%0D%0Aa%3Drtpmap%3A18%20G729/8000%0D%0Aa%3Dfmtp%3A18%20annexb%3Dno%0D%0Aa%3Drtpmap%3A4%20G723/8000%0D%0Aa%3Dfmtp%3A4%20bitrate%3D6.3%0D%0Aa%3Drtpmap%3A2%20G726-32/8000%0D%0Aa%3Drtpmap%3A9%20G722/8000%0D%0Aa%3Drtpmap%3A101%20telephone-event/8000%0D%0Aa%3Dfmtp%3A101%200-15%0D%0A
    variable_rtp_use_codec_string: OPUS,G722,PCMU,PCMA,VP8
    variable_audio_media_flow: sendrecv
    variable_remote_media_ip: 192.168.1.176
    variable_remote_media_port: 10140
    variable_rtp_audio_recv_pt: 0
    variable_rtp_use_codec_name: PCMU
    variable_rtp_use_codec_rate: 8000
    variable_rtp_use_codec_ptime: 20
    variable_rtp_use_codec_channels: 1
    variable_rtp_last_audio_codec_string: PCMU%408000h%4020i%401c
    variable_read_codec: PCMU
    variable_original_read_codec: PCMU
    variable_read_rate: 8000
    variable_original_read_rate: 8000
    variable_write_codec: PCMU
    variable_write_rate: 8000
    variable_dtmf_type: rfc2833
    variable_endpoint_disposition: RECEIVED
    variable_call_uuid: 538c7d22-e705-11e7-bc33-73bec77e82ec
    variable_current_application_data: 192.168.1.208%3A5555%20async%20full
    variable_current_application: socket
    variable_socket_host: 192.168.1.208

    """
  end
end
