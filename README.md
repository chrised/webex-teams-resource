# webex-teams-resource

A resource for sending messages to WebEx Teams from Concourse.

## Usage

```yaml
resource_types:
  - name: webex-teams
    type: registry-image
    source:
      repository: chrised/webex-teams-resource
      tag: latest
    check_every: 4h

resources:
  - name: wxt_room
    type: webex-teams
    source:
      room_id: ((my_room_id))
      access_token: ((my access_token))

jobs:
  - name: Send message
    plan:
      - put: wxt_room
        params:
          markdown: |
            Resource message<br />
            [with hyperlink](https://github.com)
            ```
            code block also
            wow
            ```
```
