---
title: "Sensationalist Security Reporting"
date: 2022-10-30
author: DR
draft: false
---

Today I want to discuss one of the largest problems facing the world of security. Not an external threat, a malicious actor or some new, ground-breaking malware. Today I want to discuss an internal threat, a problem that comes from within:

Sensationalist reporting in Infosec.

Over the past years, reporting in Infosec has started to follow the same general path as reporting in general. Factual information is hidden behind problematic communication. Professionalism has vanished and been replaced by a sort of frantic nervousness that explodes with every new notifcation.

The core of the problem is this: Infosec reporting is driven by the same click-based metrics as all other reporting standards. Funnel traffic to the site, get clicks, get ad-revenue. News sites are operated as businesses, which tend towards poor business practices. The general air of concern about information security amplifies the effect, and we get situations like the two I am going to discuss today.

### Log4Shell, Spring4Shell and Text4Shell

Earlier this week, another vulnerability was discovered in an Apache commonly used package; Apache Commons Text. The internet froze and collectively shat itself. After all, the last time we experienced this was Spring4Shell. Before that, Log4Shell.

There's one difference. Neither of the subsequent [word]4shell exploits was as widespread or dangerous as Log4Shell. Log4shell was a criticality of 10.0. And it hit a huge amount of systems. Though not all of them, by a long shot. Only systems running Java could be vulnerable. As someone who's tech stack involves no Java, I ducked it completely. As I did with Spring4Shell.

The latest issue, 9.8 severity, hardly hit anyone at all. Use of the Apache Commons Text is nowhere near as widespread as Log4j2 use.

This indicates the issue with the current severity metrics in InfoSec reporting. Severity reporting is not a measure of widespread impact. It is a measure of the severity for an affected systems. 10.0 Log4Shell was extremely dangerous on vulnerable machines. Text4Shell at 9.8 is similarly dangerous. But these metrics ignore the simple fact that Log4Shell's impact dwarved Text4Shell, but the only measureable metric we have would indicated differently.

Cybersecurity reporting needs an update, to include reporting metrics such as potential impact to the internet as a whole, alongside the current severity.

### OpenSSL 3.x upcoming updates.

On November 1st, 2022, OpenSSL 3.0.7 will release to patch an issue that exists in 3.0.0 through 3.0.6.

On the surface, this is a completely innocuous notification, exactly what OpenSSL should be doing in this situation.

And then ZDnet stepped in with this [blogpost](https://www.zdnet.com/article/openssl-warns-of-critical-security-vulnerability-with-upcoming-patch/)

The tagline, directly below the title is as follows:

> We don't have the details yet, but we can safely say that come Nov. 1, everyone -- and I mean everyone -- will need to patch OpenSSL 3.x.

Everyone. And I mean everyone. That's a bold claim. Every single person will need to patch OpenSSL 3.x?

Let's dive into the post. He covers how bad the issue is, stating the severity of "Critical". But as we saw before, critical is only critical on systems where OpenSSL 3.x is installed. And based on Steven Vaughan-Nichols' claims that everyone needs to patch, that should be everywhere, right?

He then goes on to cite various other exploits, including HeartBleed from 2014 (severity 7.5, yet somehow the worst OpenSSL experienced. Call for new metrics, much?) 

The fact is, most of this post is bait. Intended to drive traffic, not to be impartial information. It is business. Not news.

The post does, eventually, get to the point that only OpenSSL 3.0.0 through 3.0.6 are affected, which is the most important factor to consider.

Ubuntu, the most popular distribution of the Linux operating system, only switched to OpenSSL 3.x in the 22.04 LTS release. LTS releases are intended for a 5 year lifecycle, and are the most commonly used for business purposes. 18.04 and 20.04, the other LTS versions currently available (which won't be out of support until 2023 and 2025 respectively) run OpenSSL 1.1.1 by default and are subsequently unaffected. Ubuntu 22.04 was released, as the number may suggest, in April of 2022.

Red Hat Enterprise Linux shows a similar story. RHEL 9.0, the first to default to OpenSSL 3.x as the installation candidate, was released in May of this year.

What this means, is that unless you're upgrading your production systems within the first 6 months of release of a new operating system, you are going to be fine. Assuming you haven't manually installed 3.x for whatever reason, this "everyone must patch" vulnerability will completely pass you by.

Do you know anyone who patches Long Term Support systems within the first 6 months of a release, when they have literal years to do so? Those on 18.04 will likely be pushing first to 20.04, or upgrading next year, and those on 20.04 have 3 years before they need to consider upgrades.

All Steven Vaughan-Nichols has achieved is to degrade infosec reporting further. He hooks people in with a frightening warning, repeats dire news from the past and, almost as an afterthought, points out that the issue is likely going to be less severe than was suggested at the opening of the post, by the man himself.

Keep Calm and Carry On has been replaced with Incite Panic and Retract
