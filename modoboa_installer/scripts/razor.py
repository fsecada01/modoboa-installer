"""Razor related functions."""

import os
import stat

from .. import utils
from ..utils import get_user_info
from . import base


class Razor(base.Installer):
    """Razor installer."""

    appname = "razor"
    no_daemon = True
    packages = {
        "deb": ["razor"],
        "rpm": ["perl-Razor-Agent"],
    }

    def post_run(self):
        """Additional tasks."""
        user = self.config.get("amavis", "user")
        un, uid, gid, dir_str = get_user_info(username=user)
        # pw = pwd.getpwnam(user)
        utils.mkdir(
            "/var/log/razor",
            stat.S_IRWXU
            | stat.S_IRGRP
            | stat.S_IXGRP
            | stat.S_IROTH
            | stat.S_IXOTH,
            uid,
            gid,
        )
        path = os.path.join(dir_str, ".razor")
        utils.mkdir(path, stat.S_IRWXU, uid, gid)
        utils.exec_cmd("razor-admin -home {} -create".format(path))
        utils.mkdir(
            self.config_dir,
            stat.S_IRWXU
            | stat.S_IRGRP
            | stat.S_IXGRP
            | stat.S_IROTH
            | stat.S_IXOTH,
            0,
            0,
        )
        utils.copy_file(
            os.path.join(path, "razor-agent.conf"),
            self.config_dir,
        )
        utils.exec_cmd(
            "razor-admin -home {} -discover".format(path),
            sudo_user=user,
            login=False,
        )
        utils.exec_cmd(
            "razor-admin -home {} -register".format(path),
            sudo_user=user,
            login=False,
        )
        # FIXME: move log file to /var/log ?
