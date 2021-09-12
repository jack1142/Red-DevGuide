Triaging issues
===============

Red is quite a big project with many issues to keep track of and therefore it is important to
properly organize them, and minimize the time needed to work with and on them.

.. _life-cycle-of-an-issue:

Life cycle of an issue
----------------------

.. figure:: /_images/triaging.svg
   :target: /_images/triaging.svg

#. The issue is waiting for triage (**Status: Needs Triage**)
#. The issue has been tagged with category, type and other relevant labels
   (**Status: Awaiting For Needs**)

   - If there is not enough information to go on, appropriate **Needs** labels have been applied.
   - If triager asked the author for more information, **Needs: Author Feedback** label has been
     applied.

     - If the author responds, automation will replace this label with **Needs: Attention**
       to signify that triager needs to get back to this issue.
     - If the author doesn't respond, the issue will be automatically closed after 7 days.

#. The issue has been identified

   - If the issue is not actionable (duplicate, external, no reproduction, etc.),
     it has been closed and applied an appropriate **Resolution** label.
   - If this is an issue that does not require a design (especially bugs, but also documentation
     issues and *possibly* some enhancements), **Status: Accepted - PRs welcome** label has been
     applied.
   - If this is anything else (i.e. this is a feature or enhancement request),
     **Needs: Decision** label has been applied.

     - This is the moment where the issue has to wait for voting org member(s) to decide
       whether this issue should be pursued.

#. The issue has been evaluated by a voting org member (**Status: Accepted - \***)

   - If the decision is that the issue should not be pursued, the issue has been closed with
     the **Resolution: Won't Fix** label.
   - If the decision is that the issue should be pursued...

     - ...but it needs more discussion about the details of its implementation,
       the issue has been marked with **Status: Accepted - Needs Design** label.
     - ...and can be worked on right ahead, the issue has been marked with
       **Status: Accepted - PRs Welcome** label.

#. A contributor or org member wants to work on the issue

   The issue remains with its current status until PR is made.

#. A PR addressing the issue has been made (**Status: PR Available**)

   The automation automatically updates the labels if the issue was marked with
   **Status: Accepted - PRs Welcome** label.

   - If PR gets closed (not merged), the issue goes back to its previous **Status**.
   - If PR gets merged, the issue gets automatically closed by GitHub.
     and automation applies **Status: Resolved** and **Resolution: Fix Committed** label.

#. A release with the fix has been made (**Status: Resolved**)

   Automation applies **Resolution: Fix Released** label.


Fields in the Issue Tracker
---------------------------

All issues and PRs use a subset of these fields for categorization, indicating the state of
the issue, and its progress toward resolution.

.. tip::

   The labels listed in this document might be marked with one of these:

   .. [A] This label is applied by an automation.
   .. [T] This label triggers an automation.

Title
~~~~~

A brief description of the issue. Review whether the title is too generic or contains other text
that would not be useful when filtering issues.

Prefixes like ``[suggestion]``, ``[bank]``, ``[docs]`` are generally discouraged as they duplicate
the information that is indicated by labels already.

.. _Type:

Type
~~~~

Describes the type of issue. Some issues might have multiple types, though it should be preferred
to only label the issue with its main type(s).

For example, a PR that adds a new functionality will most likely also update the documentation,
but the PR should only be labeled with **Type: Feature** label.

======================= ======================================================================
Type                    Description
======================= ======================================================================
Bug                     Unexpected behavior, result, or exception.
                        In case of PRs, it is a fix for the foregoing.

Dependency Update       Adding/updating/removing some of Red's dependencies.

Deprecation             This intends to deprecate some functionality.

Docs                    Improvements to the docs (e.g. new topic, correction, etc.).

                        Only used for issues and PRs that exclusively involve changes to
                        the documentation.

Enhancement             Something meant to enhance existing Red features.

Feature                 New feature or request.

Informational           **(Issue-only)** Aims to provide information or facilitate discussion.

Merge                   **(PR-only)** Merging changes between branches.

Optimisation            Situations where too much time is necessary to complete the task.

Question                This is a support question.

                        Issue should be closed as unactionable and author should be pointed
                        to Red's support server at https://discord.gg/red

Removal                 This intends to remove some functionality.

Tests                   Used for issues/PRs that exclusively involve changes to the tests.
======================= ======================================================================

.. _Category:

Category
~~~~~~~~

Describes the area affected by the issue/PR. A single issue/PR can have multiple **Category**
labels assigned.

In case of Pull Requests, this is automatically applied and does not need to be touched by
the triager.

.. _Status:

Status
~~~~~~

Describes the stage of resolution the issue is currently in.

These are NOT used on Pull Requests.

.. seealso::

   `life-cycle-of-an-issue`

================================ ==================================================================
Status                           Description
================================ ==================================================================
Needs Triage [A]_                The issue needs to be triaged.
                                 This involves labeling, asking the author for feedback,
                                 reproducing bugs, etc.

Awaiting For Needs               Waiting for resolution of the `Needs` labels on this issue.

Accepted - Needs Design          The feature has been accepted but it needs voting org member(s) to
                                 approve a design before PR for it can be worked on.

Accepted - PRs Welcome           The issue has been accepted and can be worked on.

Accepted - In Progress           An org member is working on this internally.

Accepted - PR Available [A]_     This issue is accepted and has a related PR.

                                 If the issue has not been accepted yet, this status is NOT used so
                                 that the issues that still need a decision or triaging aren't
                                 affected.

                                 The label will be auto-applied *when* the label gets updated to
                                 one of the labels it can transition from so this should never be
                                 applied manually.

Resolved [A]_                    The issue has been resolved (closed).

Frozen                           We are not currently interested in this but we might make plans
                                 for it later.
================================ ==================================================================

.. _Needs:

Needs
~~~~~

A needed next action to advance the issue.

========================== ========================================================================
Needs                      Description
========================== ========================================================================
Attention [A]_             The triager or reviewer needs to come back and look at this.

                           Auto-applied after the author responds to the issue that had a
                           `Status: Needs Author Feedback <Status>` label.

Author Feedback [T]_       The original author of the issue/PR needs to come back and respond to
                           something.

                           If this is an issue, it will be automatically commented on and labeled
                           with `No Activity <Keywords>` label after 4 days of inactivity,
                           and closed with `Resolution: No Activity From Author <Resolution>`
                           after another 3 days of no activity.

Community Feedback         Indicates that we are interested in hearing more from our community
                           before continuing with this.

Decision                   The voting org member(s) need to decide whether this issue should be
                           pursued.

Label Fix [A]_             The issue doesn't match the label requirements (e.g. missing
                           `Type` or `Category` label).

Repro                      We can't figure out how to make this happen.
========================== ========================================================================

.. _Blocked:

Blocked
~~~~~~~

Indicates that the issue/PR is currently blocked by something.

Blocked
   A generic label indicating that the issue/PR is blocked for cases where none of the
   **Blocked By** labels fit the reason for blocking.

Blocked By: Damage Control
   Blocked in the interest of preventing damage. Used when the PR could cause significant issues
   if it were merged.

Blocked By: Dependency
   Blocked by a package listed as a dependency. Used when the issue/PR can't proceed
   until some issue in one of our dependencies is fixed.

Blocked By: Other PR
   Blocked by another PR. Used when this issue/PR can't proceed until a different PR on the repo
   is merged.

.. _Release-Indicators:

Release Indicators
~~~~~~~~~~~~~~~~~~

Labels that indicate something about when the issue/PR should/can be part of a release.

Release Blocker
   This needs handling prior to the next non-hotfix release.

High Priority
   This needs to be handled soon. Doesn't block a release, though it should still be considered.

Breaking Change
   Will cause breakage of some APIs. Can only be a part of ``3.x+1.0`` release.

Needs Backport To 3.x
   Needs to be backported to the 3.x version indicated by the label name.

.. _Difficulty:

Difficulty
~~~~~~~~~~

Indicates the difficulty of the issue to aid contributors in finding issues right for them.

Complex Issue
   This issue may require more than a surface level fix or be highly integrated with
   other components.

   These issues are not well-suited for people that aren't already familiar with the codebase.

Good First Issue
   This is a good issue for new contributors. Typically it is straightforward, well-defined,
   low-risk, and optionally someone is able to mentor the new contributor.

Help Wanted
   We'd like help with this issue.

.. _Keywords:

Keywords
~~~~~~~~

Various informational flags about the issue/PR.

QA: Bypassed
   Review for this PR is unnecessary or needed to be bypassed.

No Activity
   This PR or issue hasn't had activity in a while.

Automated PR
   This PR has been automatically created GitHub Actions or integrations.

Feature Branch [A]_
   This PR is directed towards a feature branch, not ``V3/develop`` or ``3.x`` branches.

QA: Changes Requested, QA: Passed
   Few reviewers use these in their workflows, if you're not one of them you shouldn't use them.

.. _Resolution:

Resolution
~~~~~~~~~~

Describes why the issue was closed. Used for **all** closed issues and not actionable PRs.

==============================   ==================================================================
Resolution                       Description
==============================   ==================================================================
Duplicate                        There's another issue on the tracker that's
                                 pretty much the same thing.

External                         For issues that are outside this codebase. Might be about
                                 the lack of support from Discord.

Fix Committed [A]_               The fix is checked in, but it has not been released yet.

Fix Released [A]_                The fix has been released.

No Activity From Author [A]_     The issue needed a response from its author
                                 but they did not respond.

No Repro                         We couldn't get this to happen, or it stopped happening entirely.

Won't Fix                        It's supposed to be this way or we're not interested
                                 in fixing this. There's probably a good reason.

Not Actionable                   There is no action to be taken in response to this issue.
==============================   ==================================================================

.. _Changelog-Entry:

Changelog Entry
~~~~~~~~~~~~~~~

Keeps track of changelog entry for the given PR. These are applied by the author of changelog as
they're mostly meant to aid them with this task.

==================== ==============================================================================
Changelog Entry      Description
==================== ==============================================================================
Pending [A]_         Changelog entry for this PR hasn't been added by changelog author yet.

Skipped              Changelog entry for this PR is unnecessary.

Added                Changelog entry for this PR has already been added to changelog PR.
==================== ==============================================================================
