# prompt
set -g tide_prompt_color_separator_same_color FF3F00

# left prompt
set -g tide_left_prompt_separator_diff_color '\u2502'
set -g tide_left_prompt_suffix ''

# right prompt
set -g tide_right_prompt_items status virtual_env time
set -g tide_right_prompt_separator_diff_color ''

# OS
set -U tide_os_bg_color 49B38E
set -U tide_os_color FF3F00

# PWD
set -U tide_pwd_bg_color 49B38E
set -U tide_pwd_color_anchors eeeeee
set -U tide_pwd_color_dirs FF3F00
set -U tide_pwd_color_truncated_dirs FF3F00
set -U tide_pwd_item_color FF3F00
set -U tide_prompt_color_frame_and_connection FF3F00

# Git
set -g tide_git_bg_color 49B38E
set -g tide_git_bg_color_unstable 49B38E
set -g tide_git_bg_color_urgent 49B38E
set -g tide_git_branch_color FF3F00
set -g tide_git_color_branch dddddd
set -g tide_git_color_conflicted FF3F00
set -g tide_git_color_dirty FF3F00
set -g tide_git_color_operation FF3F00
set -g tide_git_color_staged dddddd
set -g tide_git_color_stash dddddd
set -g tide_git_color_untracked FF3F00
set -g tide_git_color_upstream FF3F00
set -g tide_git_conflicted_color dddddd
set -g tide_git_dirty_color dddddd
set -g tide_git_icon 
set -g tide_git_operation_color 000000
set -g tide_git_staged_color 000000
set -g tide_git_stash_color 000000
set -g tide_git_untracked_color 000000
set -g tide_git_upstream_color 000000

#time
set -g tide_time_bg_color 49B38E
set -g tide_time_color FF3F00