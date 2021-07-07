Release process
===============

Red's release process involves a bit of work. This document attempts to collect,
in one place, all the steps needed to make a release of Red.

Making a release
----------------

#. Ensure there are no release blockers.

   Look at the milestone for the next release and check if there are any Release Blockers
   (labelled as "Release Blocker" on the issue tracker) that need to be handled before the release.

#. Check state of all open pull requests for this milestone.

   Decide which should be kept for the release, cooperate with another org member(s) on this.
   Move any pull requests not targeted for release to a new milestone with name of the release
   that should come after current one.

#. Review changelog PR.

   Add (or ask PR author to add) any missing entries based on the release's milestone.
   Verify that contributors list is complete and in alphabetical order.
   Merge the PR once it's ready.

#. Run "Prepare Release" workflow.

   Go to https://github.com/Cog-Creators/Red-DiscordBot/actions/workflows/prepare_release.yml

   .. tip::

      This step only takes care of automatically creating some PRs,
      it won't release anything, don't worry!

   - Click on the "Run workflow" button
   - Choose the branch you're making the release from
   - Click on the "Run workflow" button in the popover

   .. figure:: /images/prepare-release-workflow.png

#. Make a new release through GitHub Releases.

   .. attention::

      If the currently developed version on ``V3/develop`` branch is breaking (e.g. ``3.5.0``)
      and you're making a release with backports (e.g. ``3.4.13``),
      double-check that the target branch isn't set to ``V3/develop``.

   - Put the version number as tag name (i.e. ``3.4.0``)
   - Put the version number prepended with "v" as release title (i.e. ``v3.4.0``)
   - Ensure that the target branch is selected correctly
   - Write a short release description

     The description can be informal, the changelog has all the important information already.
     Be sure to put a link to full changelog from our docs in release description.

     The changelog link should point to the section for the specific release
     (the part after ``#`` in the URL), e.g.:

     .. code:: markdown

         Full changelog: https://docs.discord.red/en/latest/changelog_3_4_0.html#redbot-3-4-12-2021-06-17

   .. figure:: /images/drafting-new-release.png

   .. _write-announcement:

#. Write (not send!) an announcement for the new release.

   This is the announcement that you will later `post to Discord <publish-announcement>`.

   Remember to:

   - Mention that the changelog contains "Read before updating" section (if applicable):

     .. code:: markdown

         __**Before you update**: please ensure that you read the “Read before updating” section in the changelogs first.__

   - Include the link to changelog.

     .. note::

         - Use link to ``stable`` or tagged (i.e. ``3.4.0``) version of docs,
           DO NOT USE link to ``latest``.
         - The changelog link should point to the section for the specific release
           (the part after ``#`` in the URL)

         For example:

         .. code:: markdown

            Full changelogs here: <https://docs.discord.red/en/stable/changelog_3_4_0.html#redbot-3-4-12-2021-06-17>

#. Check the correctness of Release information and approve or reject the environment run.

   .. danger::

      This is the step when the new version will get published.

      At this point you should already have `written the announcement <write-announcement>`
      that you will be sending after this is done.

   Go to https://github.com/Cog-Creators/Red-DiscordBot/actions/workflows/publish_release.yml

   - Click on the first workflow run on the list.
   - Click on the "GO HERE BEFORE APPROVING" job.
   - Expand the "REVIEW OUTPUT OF THIS STEP BEFORE APPROVING" step.
   - Verify the correctness of the release information printed in the step.
   - Go back to Summary, click on "Review deployments" and approve or reject the environment run.

#. Wait for the CI to finish its job.

   "Publish Release" workflow needs to finish before you can continue.

   .. _publish-announcement:

#. Send and publish an announcement in Discord.

   This is the announcement that you wrote in `the earlier step <write-announcement>`.

#. Merge the PR bumping to dev version.

   It should have been automatically created during "Publish release" workflow
   that you approved earlier.

#. Close release milestone and create a new one.

   Close the milestone for the release that was just made
   and create an appropriately named milestone for the next release.

After all this is done, you can enjoy the new release
(or make a hotfix if there's a critical issue, let's hope there's not though :))
