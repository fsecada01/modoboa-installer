use strict;

# You can modify this file to re-enable SPAM checking through spamassassin
# and to re-enable antivirus checking.

#
# Default antivirus checking mode
# Please note, that anti-virus checking is DISABLED by
# default.
# If You wish to enable it, please uncomment the following lines:

%{clamav_enabled}@bypass_virus_checks_maps = (
%{clamav_enabled}   \%%bypass_virus_checks, \@bypass_virus_checks_acl, \$bypass_virus_checks_re);

#
# Default SPAM checking mode
# Please note, that anti-spam checking is DISABLED by
# default.
# If You wish to enable it, please uncomment the following lines:


@bypass_spam_checks_maps = (
   \%%bypass_spam_checks, \@bypass_spam_checks_acl, \$bypass_spam_checks_re);

1;  # ensure a defined return
