task bamstats {
    File bam_input
    Int mem_gb

    command {
        bash /usr/local/bin/bamstats "${mem_gb}" "${bam_input}"
    }

    output {
        File bamstats_report = "bamstats_report.zip"
    }

    runtime {	# last number is the version number for github
        docker: "quay.io/collaboratory/dockstore-tool-bamstats:1.25-6_1.0"
        memory: mem_gb + "GB"
    }

    meta {
        author: "Fenglin Chen"
    }
}

workflow bamstatsWorkflow {
    call bamstats
}
