Tag Background

The inspiration for this template came during the migration from UA to GA4. In UA there were only 3 levels of data you could have for an event - Category, Action and Label. As a result you would regularly need to put multiple data points into any one of those fields.<br>

In this example we have two data points in Label, the card type and the CTA on the card, separated by a " | ".<br>

Category: Homepage Interaction<br>
Action: Dynamic Card<br>
Label: [Card Type] | [Card CTA]<br>

The dataLayer push which triggered this event could look like:<br> 

window.dataLayer.push({<br>
'eventCategory' : 'Homepage Interaction',<br>
'eventAction' : 'Dynamic Card',<br>
'eventLabel' : 'image-text-2 | Latest News',<br>
'event' : 'homepageCardClick'<br>
});<br>

When it comes to GA4 we can have many event parameters so we may want to setup our event as follows:<br>

event_name: Homepage Interaction<br>
event_action: Dynamic Card<br>
card_type: [Card Type]<br>
card_cta: [Card CTA]<br>

As there can sometimes be long lead times in the development teams, instead on waiting on them to update all the dataLayer pushes on the site before commencing on the GA4 migration, you could use this splitter to split the eventLabel on " | " and return array position 0 for the card_type and position 1 for the card_cta.<br>

I'm sure the template can have other applications, this was just the inspiration for it.
