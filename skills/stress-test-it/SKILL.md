---
name: stress-test-it
description: >-
  Interrogate and sharpen a plan, decision, idea, or strategy by mapping it as a
  design tree and working that tree in rounds — each round asks every question
  whose prerequisites are settled, gives a recommended answer for each, then
  waits for the user's decisions before recomputing the frontier. Use whenever
  the user wants to stress test their thinking, pressure-test a plan,
  sanity-check an approach, find what they're missing, or settle something with
  many interlocking sub-decisions. Triggers: "stress test this", "poke holes in
  this", "help me think this through", "what am I not considering", "pressure
  test my plan", "I need to figure out X and a lot hangs off it". Produces
  numbered rounds of questions in chat plus a durable markdown decision record
  with sourced facts. Do NOT use it to critique something already built (that's a
  review, not a decision tree), or when the user wants work executed rather than
  decided. For a bare single question, fire only when the user explicitly says
  "stress test".
---

# Stress-test a plan, decision, or idea by working its design tree

This is an interrogation, not a plan and not a review. You are not here to produce a
recommendation document, a task list, or a critique of something already built. You are here to
find every decision hiding inside the user's idea, put each one to them, and hold the structure
while they work through it.

Two things make this work, and they're the two things you'll be tempted to skip:

- **The decisions are theirs.** You always recommend, and you never decide. Every round ends with
  you waiting.
- **The facts are yours.** Anything determinable by reading code, fetching a doc, or querying a
  system, you go determine — and every one carries a citable source, because a settled decision
  cites the facts it rests on and months later that chain is the only thing that explains why.

The loop is: **find the root → decompose → resolve the facts yourself → ask the whole frontier →
wait → reshape → repeat until the frontier is empty.**

## When to use, and when not to

Use it when there is a live decision with structure underneath it: a plan with sequencing, a
technology choice with constraints hanging off it, a product bet with unexamined premises, an org
change with second-order effects. Domain does not matter — the method is identical for a database
choice and a hiring plan; only where you go looking for facts changes.

Do not use it for:

- **Critique of something already built.** A PR review, a bug hunt, a findings list — those have
  no open decisions, and forcing a tree onto them produces branches nobody can answer.
- **Plan-and-execute requests.** This skill ends at settled decisions. It does not do the work.
- **A bare single question,** unless the user explicitly says "stress test". A message opening with
  `stress-test:` or `stress test this:` counts as explicit — take it.

That last exclusion is narrow on purpose: it means *a lone question with nothing hanging off it*.
A request that presents an idea with interlocking parts or an unexamined premise is the core use
case and needs no special trigger, even if it never says "stress test". If you're unsure which you
have, the tell is whether decomposing produces more than one node.

If an explicit "stress test" lands on a request that looks like critique or execution, don't
silently override and don't refuse. Say in one line what the request looks like it actually wants,
and offer.

## The tree, and what earns a node

A node earns its place as a **child** only if it passes this test: *would I ask this question
differently depending on how the parent is answered?* If no, it's a sibling, not a child — it was
never blocked, and burying it a level deeper delays a question you could have asked in round one.

Refuse to create nodes for implementation trivia. A node is a real decision only if a reasonable
person could choose differently **and** the choice matters downstream. This is what keeps the tree
finite, and a finite tree is the only reason "frontier empty" ever arrives.

**The frontier** is every unsettled decision whose prerequisites are already settled — what you can
ask now without guessing at answers you haven't heard. A question whose answer depends on another
question still open in this round belongs to a later round. Violating that means asking the user to
answer in a vacuum, which produces answers they'll want to take back two rounds later.

**Numbering.** Assign a number when a node is created, including deferred ones, and never reuse or
renumber. Leverage sorts how you *present* a round, not what things are called, so a deferred
question promoted later arrives out of numeric order. That's fine and far better than renumbering —
the user navigates by stable numbers across many turns.

## Process

**1. Find the root, then walk up until you hit something settled.** Name the decision the user
stated, then the one above it, and ask honestly whether it's settled. Often it's one level up;
frequently two or three are all open. Surface each open one and order them by leverage — don't stop
at the first parent if the one above *that* is also live, and don't force several into one question.

Reframing the premise is not enough on its own. **If a parent is open, it becomes a numbered
question you wait on** — not a preamble you assert and then move past. That conversion is the whole
point: it hands the user a decision they didn't know they were making.

**2. Decompose freely, then sweep for blind spots.** Build the tree from the shape of the actual
idea rather than filling in a template — that's what makes this domain-agnostic. Then check whether
reversibility, who actually decides, what would falsify this, cost of being wrong in each
direction, and what happens if we do nothing are live decisions *here*, and add the ones that are.
It's a check, not a checklist to complete.

**3. Classify every node: fact or decision.** A **fact** is determinable — what the code does, what
the vendor's limits are, what the neighboring team chose. A **decision** is a judgment the user
owns. Facts you resolve and report; decisions always go to the user, with no exception for the ones
where the answer looks obvious to you.

There is a third case worth naming because it's easy to mishandle: **a fact only the user holds** —
expected write volume, a headcount they haven't published, whether a vendor agreement exists. It's
not a decision, so it doesn't belong in Decisions as a numbered question. Put it in Pending
research as a request for the number, with what it would settle.

Also resolve ambiguity in the user's own vocabulary as a fact, not a question. If "programs" could
mean two different things, go find out which — asking them to define their own terms spends a
question on something you could have looked up. Record the disambiguation *on the fact*, including
the reading you rejected, so a later round doesn't re-derive it and the user can correct you in one
line if you picked wrong.

**4. Resolve the facts yourself, in parallel, inside your own turn.** The invariant is that facts
get resolved in parallel within your own turn and each carries a citable source. That's the
contract; the tool satisfying it is not.

Whatever tool you use, tell it — or hold yourself to — four rules: every claim needs a source (URL,
`file:line`, record id); every source needs its own date — when it was published, last updated,
revised, committed, or said — or an explicit "undated"; report "unverified" rather than guess; and
write nothing. The second rule is the one researchers skip, and it can't be recovered later without
re-fetching everything: a page's byline or footer, a PDF's revision block, a file's last commit, a
release's date are all cheap to read while you're there and expensive to go back for. If a subagent
tool is available, prefer it and batch independent tasks into a single message (`explore` for codebase and
doc questions, `general` for multi-step research); note that subagents can't spawn subagents
(`subagent_depth` defaults to 1) and that `background: true` errors on a default install. If there's
no subagent tool, do the research yourself, batching independent lookups into parallel calls. A
missing subagent tool changes the mechanism, not the contract — don't treat it as a blocker and don't
report it to the user as though it degraded the work.

Blocking here is fine — it's your time, not the user's. What matters is that **the round never
stalls**. A fact you couldn't pin down doesn't stop the round: the question either gets asked anyway
with a low-confidence recommendation and the gap named on it, or moves to pending research.

**5. Compute the frontier.** Take every unsettled node whose prerequisites are settled. Sort by
leverage. Then split into real **decisions** and **cheap confirmations**.

The split test: a **cheap confirmation** is one where you expect a one-word answer — you can state
the recommendation and its reason in a single line, and you'd be mildly surprised to be overruled.
A **decision** is one where a reasonable person might spend a paragraph arguing. When genuinely
torn, call it a decision: miscategorizing down costs the user a real choice, miscategorizing up
costs them ten seconds.

There is no cap. If the frontier is fourteen questions, ask fourteen — withholding ready questions
to keep rounds tidy creates fake rounds. A round past ten *active* questions usually means the tree
is too finely grained; collapse nodes that failed the child test. Pending and deferred don't count,
since the user isn't being asked to answer them.

"No cap" and the child test pull against each other, and **the child test wins.** A thin round of
three questions whose answers are all genuinely independent is better than a fat one where four of
the questions would have been phrased differently once the others came back. Deferring your most
concrete-feeling questions often feels like under-delivering; it isn't.

**Pending research** holds questions blocked on research you can't do yet: gated on a user answer,
or too expensive to run speculatively. If a question is blocked on both a user answer and data you
can't reach, it's deferred — the user answer is the binding blocker — and you note the data gap
inline. Don't split one question across two sections.

**6. Write the state file before presenting.** Default `~/stress-tests/<YYYY-MM-DD>-<slug>.md`, and
echo the path in the round so the user can redirect you. If the decision is repo-coupled and belongs
in version control, offer the repo instead — and if that repo is read-only or off-limits, keep the
default path, name the repo location you'd have chosen, and say why you didn't use it, rather than
silently dropping the offer. Plain markdown, maintained with the edit tool. The user will read this
months from now; it has to stand on its own.

**7. Present the round, then stop.** Reframe if you have one, then what you checked, then the
numbered questions with recommendations. Then stop and wait. Don't answer your own questions, don't
start implementing, don't ask "shall I proceed" — the round *is* the turn.

**8. Reshape on the answers.** Settled decisions push the frontier outward and unblock what depended
on them. Then:

- **Prune visibly.** When an answer makes a branch moot: "Dropped Q14–16, moot now that X." Visible
  pruning is how the user knows the tree is live and not a pre-baked list.
- **Reopen on contradiction, and never silently override.** A finding that contradicts a settled
  decision goes in a `## Reopened` block at the top of the round with the evidence, with everything
  downstream marked provisional. **Their call stands if they reject the finding** — say so
  explicitly. Facts carry provenance precisely so they can judge whether yours is stale or wrong,
  and a reopen that reads as you overruling them is worse than no reopen.
- **Dissent once, then move on.** If you think an answer is wrong and have only judgment, say so
  briefly, record it as a noted dissent, accept it. A yes-man stress-test is worthless; an agent
  that relitigates settled nodes is unusable.
- **Caveat is not dissent.** If you've found a *fact* they didn't have when they answered, that's
  not disagreement. Record their answer as given, note the caveat, and turn what it complicates
  into a new node rather than reopening what they just settled.
- **Accept partial answers.** "You decide," "3 and 5: go with your rec," and "4 isn't a real
  decision, drop it" are all legal. Skipped questions stay on the frontier — never silently resolve
  one because they didn't get to it.

**9. Close out when the frontier is empty.** Append the decision record to the state file and render
it in chat. The user can also call it early — "enough, write it up" — in which case unsettled nodes
go into the record as open, with their recommendations attached, so the session stays resumable.

**Resuming.** If a state file exists for this topic, read it and reconstruct the frontier rather than
starting over. Before presenting, re-verify the `decays` and `point-in-time` facts that the current
frontier actually depends on. Judge each by its age — today minus its *as of* date — against how fast
that kind of thing moves; there's no hardcoded threshold because a year is nothing for a protocol
spec and a lot for a vendor's price list. The judgment changes what re-verifying means: a `decays`
fact whose source was already a decade old at capture doesn't need the same page re-read, it needs a
second, newer source, and until one exists the question resting on it names the age as a gap, the
same way it would an unverified fact. A fact in the file with only a retrieval date — the older
format, or someone's shortcut — has an unknown age, which is worse than a known old one: find the
source's date if the fact is load-bearing this round, and record it as a REDATED amendment so the
next resume doesn't repeat the lookup. Work from the *data the open questions need*, not just the
fact list: a fact that looks irrelevant on paper is often the one that turns out to be false, so if
answering a frontier question would touch a stale fact, check it. Then present with a short "picking
up from" header.

Round numbers increment per round presented, even when the previous round went unanswered — say
"nothing was settled in round N, so this round reshapes on new facts instead" rather than
re-presenting round N, because a future resume relies on monotone numbering.

If `~/stress-tests/` holds a session on an adjacent but distinct topic, mention it and ask whether
they're related rather than asserting a dependency you haven't confirmed.

## Round format

```markdown
<Optional, 2-3 sentences: if your research overturned the premise, say so here, before the facts.
Round 1 is where a premise challenge is most valuable, and it is neither a fact nor a question, so
it needs its own space. Anything genuinely open in it still becomes a numbered question below.>

## What I checked

| Fact | Source | As of | Volatility |
|---|---|---|---|
| **F1** <the claim, stated flatly> | <URL / file:line / record id / command> | <the source's own date — published, revised, commit, version — or `c. <year>` or `undated`> | stable / decays / point-in-time |
| **F7** <a claim you could not establish> | unverified — <what blocked you> | — | — |

## Reopened

**Q<n> — <what it was settled as, and what it rested on.>** <The contradicting evidence.>
<What is now provisional. Their call stands if they reject this.>

## Round <N> — frontier (<X> active, <Y> settled<, Z reopened><, W dropped>)

State file: `~/stress-tests/<date>-<slug>.md` — redirect me if you want it elsewhere.

### Decisions

**<n>. <The question, in one line.>** <Only if needed: the tension, in one or two sentences.>
→ *Recommend: <the answer>.* <One or two sentences of why, and the runner-up if it's close.>
*(basis: verified — F3, F9 | prior)*

### Cheap confirmations

**<n>. <Question.>** → <Recommendation, one line, why folded in.>

### Pending research

**<n>. <Question.>** — blocked on <what, and why it can't be resolved yet>.

### Deferred

Q<n>–<n> depend on <which open questions>.
```

Omit any empty section — `Reopened` appears only when something was reopened.

**A reopened node needs both blocks.** The evidence and the retraction go in `Reopened`; the question
itself, with its recommendation and basis marker, goes in `Decisions` like any other active question.
Presenting a reopen with no recommendation leaves the user with a problem and no proposal.

**Header counts.** `active` is only what you're asking this round — not pending, not deferred.
`settled` is **cumulative** across the whole session, matching the state file, and excludes anything
currently reopened. `reopened` is a *subset* of active, not an addition to it, since a reopened node
is being asked. `dropped` is this round only. Add `reopened` and `dropped` only when nonzero.

**Surface only the facts this round actually uses.** Every fact you found goes in the state file;
the round shows the ones a recommendation cites, plus any unverified fact that weakens one. A
nineteen-row table in chat buries the questions underneath it, and the questions are the point — if
a fact isn't carrying a recommendation or naming a gap *this round*, it's reference material, and
reference material belongs in the file. Say what you're holding back so the user knows the file is
fuller than the round: "Nine further facts in the state file." When a later round starts leaning on
one of those, surface it then, with the same id.

**Facts carry ids in the round, not just the state file**, because the basis marker cites them:
`(basis: verified — F3, F9)` has to be resolvable without opening the file. Ids are permanent and
shared between round and file — a fact keeps its id whether or not it's on screen this round.

**A fact you couldn't establish still belongs in the table.** Give it an id, state the claim, write
`unverified` and what blocked you, leave volatility empty. Negative findings are load-bearing —
they're what tells the user which recommendation is standing on nothing. Then name the gap on the
question that depended on it. Keep these about the *claim*, not about your tooling: one unverified
fact for "I couldn't size the pain" beats three facts about which endpoints were down.

Every recommendation carries a **basis marker**. `verified` means it follows from facts you checked,
cited by id. `prior` means it's your judgment. The user has to be able to tell which recommendations
are load-bearing on evidence and which are vibes, because those warrant very different trust.

If asked to see the tree, render a plain indented list with status markers, not mermaid — it reads in
a terminal, diffs cleanly in the state file, and a thirty-node tree is unreadable as a graph.

```
- [settled] Root: change the pricing model to usage-based
  - [settled] Q2 Who owns the migration comms
    - [active] Q9 Do existing contracts get grandfathered
    - [pending] Q10 Notice period — blocked on Q9
  - [dropped] Q7 Billing vendor — moot, existing one supports it
```

## State file

```markdown
# Stress test: <topic>
Started <date> · last updated <date> · round <N> · <N> settled, <N> open

## Decision record
<Written at close. One line per settled decision: the question, the answer, the date,
and the fact ids it rests on. Open items listed as open with their recommendations.>

## Settled
- **Q1 <question>** — <answer as given>. <date>
  - Rests on: F2, F5
  - Dissent noted: <only if you disagreed with their judgment, one line>
  - Caveat recorded: <only if you later found a fact they didn't have, one line>

## Facts
- **F1** <claim>. Source: <URL / file:line / record id>, as of <the source's own date: published,
  last updated, revision, commit or version, the day it was said — or `c. <year>` with what you
  inferred it from, or `undated`>. Retrieved <date> via <how>.
  Volatility: stable | decays | point-in-time
- **F4** RETRACTED <date> — <why the claim was false, and what replaced it>. Was: <original>.
- **F2** CORRECTED <date> — claim holds, original source didn't support it. Now sourced to <x>.
- **F9** REDATED <date> — claim and source hold; source is as of <older date>, not <what was
  assumed>. <Where the date came from, and what it changes for anything resting on this.>

## Active frontier
## Pending research
## Deferred
## Dropped
- Q7 <question> — dropped <date>, moot once Q3 settled as <answer>.
```

Record the **round number** so a resume doesn't have to infer it from settle dates.

Facts get ids because settled decisions cite them, and that chain is what makes the record worth
keeping: months later the user sees not just what they decided but what they believed when they
decided it. So never delete a fact that turned out wrong — deleting breaks the chain from every
decision resting on it, which is exactly when you most need to see what went wrong. Mark it in
place instead, and distinguish the two failure modes, because they mean different things to a
future reader:

- **RETRACTED** — the claim was false.
- **CORRECTED** — the claim holds, but the source never supported it. Retracting this would falsely
  imply the claim was wrong.
- **REDATED** — the claim and the source both hold, but the clock was wrong: the source turns out to
  be older than the record implied, usually because only the retrieval date was written down. Nothing
  about the fact is false; what changes is how much a `decays` tag has already eaten into it, and
  that can be enough to want a second source under any decision resting on it.

**Volatility is the useful axis, not confidence — and it needs an age to work.** A `file:line` fact
rots on the next commit; a published spec doesn't; a headcount is true the day you read it and
nowhere else. Aggregate counts over someone's working copy are `decays` and then some — say so in the
source, because "true of this checkout today" is weaker than "true of main." Tagging at capture is
cheap while you still remember where the fact came from, and it's what tells a future reader what to
re-verify.

But volatility only says *whether* a fact rots. How far along the rot already is depends on when the
source was true, and that is not the day you read it. A vendor guideline written in 2013 and read in
2026, tagged `decays` with only the retrieval date beside it, looks thirteen years fresher than it is
— and a decision resting on it inherits that false freshness. Anyone reasoning about staleness, you
included, does fine given both the volatility and the age; nobody can infer the age from the
retrieval date. So every fact carries the source's own date as a field — *as of* — beside the
retrieval date, and the decay clock runs from *as of*. For a page that's the publication or
last-updated date; for a PDF its revision; for code the commit or version (with the release date if
it's cheap); for a measurement the day it ran; for something the user told you, the day they said it.

Two values are legal when the source won't give you a date. `c. <year>` when you can bound it — a
copyright line, the newest thing it references, a product it treats as current — and say what you
bounded it from so a later reader can tighten or reject the inference. `undated` when you can't. Treat
`undated` as old, not as fresh: recent writing usually says when it was written, and the pages that
don't are disproportionately the ones nobody has touched in years.

## Gotchas

- **Asking a question that depends on another open question.** The most common failure, and it looks
  productive. Before presenting, re-read each question: if the user answered these in any order,
  would any change how you'd phrase another? If yes, it belongs in a later round.
- **Spending a question on a fact.** "How many services consume this topic?" is not a decision. Go
  count them. Every question spent on a lookup is one the user has to do your work for.
- **Accepting a fact without a source.** An unsourced fact is worse than no fact, because it gets
  cited by a decision and then nobody can re-check it. A claim with no source is `unverified`, and
  saying so is a finding, not a failure.
- **Treating a directory listing as evidence of absence.** "No orchestrator is deployed" from a
  top-level `ls` is how a false fact gets an id and then anchors three decisions. Absence claims need
  the same rigor as presence claims — check the manifest, the lockfile, the config, the entrypoints.
- **Starting the decay clock at retrieval.** The fact says `decays`, the only date on it is the day
  you read it, and so it reads as fresh — when the page was written years ago and the fact is most
  of the way to wrong. The retrieval date tells a future reader when *you* looked; the *as of* date
  tells them how old what you found already was. Both, every time, on `decays` facts especially.
- **Reading an undated source as current.** No date on the page does not mean written today; it
  means you can't see when the rot started. Write `undated`, look for a floor (copyright line,
  newest referenced event, a version it calls latest), and lean on it less, not more.
- **Letting a heading carry what belongs on the fact.** `### External, point-in-time (2026-09-25)`
  over a block of undated facts looks tidy and loses every one of those dates the moment a fact is
  cited by id from somewhere else. Date, *as of*, and volatility live on the fact line.
- **Letting the state file go stale.** Update it before presenting each round, not at the end. A
  session interrupted at round four with an empty file wasted four rounds.

## References

The round format and state file templates above are the spec — match them rather than improvising
structure, because the user navigates by stable question numbers and fact ids across many turns.
