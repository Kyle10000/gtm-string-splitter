Tag Background

The inspiration for this template came during the migration from UA to GA4. In UA there were only 3 levels of data you could have for an event - Category, Action and Label. As a result you would regularly need to put multiple data points into any one of those fields.

In this example we have two data points in Label, the card type and the CTA on the card, separated by a " | ".

Category: Homepage Interaction
Action: Dynamic Card
Label: [Card Type] | [Card CTA]

The dataLayer push which triggered this event could look like: 

window.dataLayer.push({
	'eventCategory' : 'Homepage Interaction',
	'eventAction' : 'Dynamic Card',
	'eventLabel' : 'image-text-2 | Latest News',  
	'event' : 'homepageCardClick'
});

When it comes to GA4 we can have many event parameters so we may want to setup our event as follows:

event_name: Homepage Interaction
event_action: Dynamic Card
card_type: [Card Type]
card_cta: [Card CTA]

As there can sometimes be long lead times in the development teams, instead on waiting on them to update all the dataLayer pushes on the site before commencing on the GA4 migration, you could use this splitter to split the eventLabel on " | " and return array position 0 for the card_type and position 1 for the card_cta.

I'm sure the template can have other applications, this was just the inspiration for it.
