class Array
  def inject_danny(*inputs)
    if block_given?
      if inputs.size.zero?
        memo = self[0]
        start_idx = 1
      else
        memo = inputs[0]
        start_idx = 0
      end

      idx = start_idx
      while idx < self.size
        memo = yield(memo, self[idx])
        idx += 1
      end
      memo
    else
      case inputs.size
      when 1
        memo = self[0]
        idx = 1
        proc = inputs[0].to_proc
        while idx < self.size
          memo = proc.call(memo, self[idx])
          idx += 1
        end
      end
      memo
    end

  end
end
