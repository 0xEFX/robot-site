---
title:  "Kubernetes Controversy"
date:   2020-08-22 14:34:46 +0000
author: DR
draft: false
---

I don't like Kubernetes. There. I said it. Controversial I know. Given that huge share of news it receives, you'd hardly know there are other container orchestration solutions out there. Personally I find myself wondering why. I don't think the tool is good enough to warrant such attention. But eager to improve myself, I decided to look into the why. After all, perhaps I was wrong. Perhaps I simply didn't understand the Kubernetes use-case.

I've had the opportunity to deal with DevOps consultants from the very start of their inception. Google Trends suggests this term started its increase from 2013 and 2015. I've held positions in DevOps. I've worked alongside them. And I've asked them all this question. "Why Kubernetes?" or "Why K8s over Swarm?".

So far no one has had a satisfactory answer for me.

And that's not me being obtuse, or an effort to be a dick on my part. Explanations range from the circular, K8s is good because K8s is good, through the crowdsourced, K8s has a massive community behind it so it must be great, to flat out lies about competitors, along the lines of "It's 2018, Swarm is dying." or "It's 2019, Swarm is dying." and my personal favourite: "It's 2020, Swarm is dying."

Apparently Swarm dying takes its own sweet time. I hope it's using these last years wisely.

Bret Fischer, Docker captain and fan of both Docker Swarm and Kubernetes suggests that 80% of use-cases can be solved with Docker Swarm, which has a comparative 20% of K8s' features. There's a reason for that, which I'll get to slightly later. He goes on, in his comparison of Swarm Vs K8s, to suggest that one of the primary reasons you'd use K8s is that "Your boss told you to." I'd like to add another reason of "Vendor-locks" but for that, we need to know why K8s became so popular.

I'm going to blame Google. Google created Kubernetes in 2014. While Docker struggled to maintain a profitable business model, Google was able to penetrate the market with as much force as you'd expect from the world's 4th largest tech company, weaving a network of partners to praise and push their parallel platform. That we should espouse one, and ignore the other. There are a set of unwritten rules in tech, and one of them is this: You don't mess with ~~SkyNet~~ Google. (Unless you're the EU) And what happens with their partners? Basically drones. Going out into the wild and pushing K8s into places where it has no business.

In the meantime, for the developer who already knows Docker (as most of them do), Docker Swarm comes easily. A Developer becomes DevOps, at least in part. Docker Swarm is simple. Docker Swarm is self contained. Docker Swarm is secure.

Kubernetes is none of these things. Being an Orchestration tool relying upon containers, it cannot be self contained. It requires Docker. Or containerd. But Kubernetes doesn't just complicate a tech stack with itself. You'll rarely see it without addons installed. Maybe you want helm to manage your distribution. And then it has no native DNS so you'll need to install an addon for that. And then you'll need to secure it, because the default options are insecure. So not only do you add complexity with the tool itself, you add three or four other tools to support it. What happened to KISS mentality? How is piling four additional systems on-top of a system that was already functional at all simple?

Now, I'm not saying Kubernetes has no place. It very clearly does. And if you're reading closely enough you should have already figured it out. As Bret Fisher said: 80% of the use cases. Kubernetes exists for the additional 20% of use-cases where you need the advanced features it offers. And given the developers, you should be able to know who is using those advanced features.

If not, here is a handy, text-based flow-chart. Feel free to print it off and add it to your fridge.

```
Are you Google?
|=> Yes -> Use Borg. Why are you even looking at this chart?
|=> No  -> Is your tech stack as complex as Google's?
      |=> Yes -> Is it, though? Is it really?
      |=> No  -> Do you hate your developers, and want them to feel the same about you?
                 |=> Yes -> Use Kubernetes
                 |=> No  -> Use Docker Swarm
```
