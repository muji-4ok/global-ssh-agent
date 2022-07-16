# global-ssh-agent

Are you opening many shells and ssh connections at the same time? And you don't want to enter your password and setup the ssh-agent each time? Then this simple script will help you.

What it does is it allows you to use the same ssh-agent process for each shell. This way you can do `ssh-add /path/to/key` from one shell and have it available everywhere until you reboot your computer.

## How to use

Clone this repository somewhere:

```bash
cd /some/where
git clone https://github.com/muji-4ok/global-ssh-agent.git
```

Put these lines in your `.bashrc`:

```bash
source /some/where/global-ssh-agent/global_ssh_agent.sh
init_global_ssh_agent
```

Now you should kill any existing ssh agents if they are runnning. And then whenever you open a new shell, you will be able to connect to the global ssh-agent from it.

## How this works

Essentially the ssh-agent works by setting up the environment variables `SSH_AGENT_PID` and `SSH_AUTH_SOCK`. And the `ssh` binary uses them if they are setup. This script simply stores these variables somewhere and sets them up inside `.bashrc`, thus allowing ssh to work.
