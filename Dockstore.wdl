version 1.0

task bamstats {
    input {
        File bam_input
        Int mem_gb
    }

    command {
        bash /usr/local/bin/bamstats "${mem_gb}" "${bam_input}"
    }

    output {
        File bamstats_report = "bamstats_report.zip"
    }

    runtime {	# last number is the version number for github
      # docker: "quay.io/f73chen/dockstore-tool-bamstats2:1.25-6"
        docker: "g3chen/dockstore-tool-bamstats3:1.25-6"
      # docker: "quay.io/collaboratory/dockstore-tool-bamstats:1.25-6_1.0"
        memory: mem_gb + "GB"
    }

    meta {
        author: "Fenglin Chen"
    }
}

workflow bamstatsWorkflow {
    input {
        File bam_input
        Int mem_gb
    }

    call bamstats { input: bam_input=bam_input, mem_gb=mem_gb }
}
