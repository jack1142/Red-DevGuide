Triaging issues
===============

Red is quite a big project with many issues to keep track of and therefore it is important to
properly organize them, and minimize the time needed to work with and on them.

Life cycle of an issue
----------------------

.. figure:: images/triaging.svg

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

   - If it is an org member, **Status: In Progress** label has been applied.
   - If it is a contributor, the issue remains with its current status until PR is made.

#. A PR addressing the issue has been made (**Status: PR Available**)

   The automation automatically updates the labels if the issue was marked with
   **Status: Accepted - PRs Welcome** or **Status: In Progress** label.

   - If PR gets closed (not merged), the issue goes back to its previous **Status**.
   - If PR gets merged, the issue gets automatically closed by GitHub.
     and automation applies **Status: Resolved** and **Resolution: Fix Committed** label.

#. A release with the fix has been made (**Status: Resolved**)

   Automation applies **Resolution: Fix Released** label.
