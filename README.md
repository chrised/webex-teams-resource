# webex-teams-resource

A resource for sending messages to WebEx Teams from Concourse.

## Usage

```yaml
resources:
  my_wxt_room:
    resource_type: webex-teams
    source:
        room_id: my_room_id
        access_token: my_bot_token
jobs:
  - name: Thing
    plan:
      - put: my_wxt_room
        params:
          markdown: |
            Hello, I am Concourse
            Vardata: `(( useful_pipeline_variable ))`

```
