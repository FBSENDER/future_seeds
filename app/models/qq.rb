class Group < ApplicationRecord
  self.table_name = 'qq_groups'
end

class Worker < ApplicationRecord
  self.table_name = 'qq_workers'
end

class Task < ApplicationRecord
  self.table_name = 'qq_task_details'
end

class TaskDetail < ApplicationRecord
  self.table_name = 'qq_task_details'
end
