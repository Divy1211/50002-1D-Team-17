@echo off

for /f usebackq %%f in (`git branch --show-current`) do set BRANCH_NAME=%%f

if not "%BRANCH_NAME%"=="fsm_testing" (
    set /p ANS="You are not on branch 'fsm_testing'. Do you wish to continue with the process (y/n)? "
) else (
    goto GIT_ACTIONS
)
if "%ANS%"=="y" (
    goto GIT_ACTIONS
) else if "%ANS%"=="Y" (
    goto GIT_ACTIONS
) else (
    goto END
)

:GIT_ACTIONS
git checkout fsm_testing
set /p MSG="Enter Commit Message: "
git add .
git commit -m "%MSG%"
git push

:END