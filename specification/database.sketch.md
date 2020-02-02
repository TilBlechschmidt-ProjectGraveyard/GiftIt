# User
- ID

## Metadata
- E-Mail (text)
- Username (text)
- ProfilePicture (File.ID)
- PayPal.me link (text)

## Settings
- PushNotificationDelay (number, days)
- BoughtVisibility (number, 0-2)

# Event
- ID
- Title (text)
- Date (date)
- Recurring (boolean)
- User (User.ID)

# File
- ID
- Binary blob or filesystem ID (text)

# Item
- ID
- BuyingDate (date?)
- GiftedDate (date?)

## Relation
- User (User.ID)
- Creator (User.ID)
- Buyer (User.ID?)

## Metadata (user entered)
- Title (text)
- Price (float)
- Currency (text, ISO identifier)
- URL (text)
- Description (text)

## Metadata (extracted/crawled)
TODO: Nothing here yet.

# Crowdfunding
- Item (Item.ID)
- User (User.ID)
- Amount (float)