class Worker < ApplicationRecord
  self.table_name = 'one_worker'
end

class Group < ApplicationRecord
  self.table_name = 'one_worker_groups'
end

class Task < ApplicationRecord
  self.table_name = 'one_tasks'
end

class TaskDetail < ApplicationRecord
  self.table_name = 'one_task_details'
end
